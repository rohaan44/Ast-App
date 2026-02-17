import 'dart:convert';
import 'package:ast_official/core/network/auth_service/auth_service.dart';
import 'package:ast_official/data/models/chat_models.dart';
import 'package:ast_official/data/repository/chat_repo.dart';
import 'package:ast_official/helpers/voice_recorder.dart';
import 'package:ast_official/services/pusher_service.dart';
import 'package:flutter/material.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class SelectedChatController extends ChangeNotifier {
  final ChatRepo _chatRepo = ChatRepo();
  final PusherService _pusherService = PusherService();
  final VoiceRecorder _voiceRecorder = VoiceRecorder();

  String? _conversationId;
  List<Message> _messages = [];
  List<Message> get messages => _messages;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _currentUserId;
  String? get currentUserId => _currentUserId;

  bool _isTyping = false;
  bool _otherUserIsTyping = false;
  bool get otherUserIsTyping => _otherUserIsTyping;

  final TextEditingController textController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  SelectedChatController() {
    _init();
  }

  Future<void> _init() async {
    _currentUserId = await AuthStorage.getUserId();
  }

  void setConversationId(String id) {
    if (_conversationId == id) return;
    _conversationId = id;
    _messages.clear();
    loadMessages();
    _subscribeToConversation();
    _markAsRead();
  }

  Future<void> loadMessages() async {
    if (_conversationId == null) return;
    _setLoading(true);
    try {
      final response = await _chatRepo.getMessages(_conversationId!);
      _messages = response.messages;
      notifyListeners();
      _scrollToBottom();
    } catch (e) {
      debugPrint("Load Messages Error: $e");
    } finally {
      _setLoading(false);
    }
  }

  Future<void> _subscribeToConversation() async {
    if (_conversationId == null) return;

    await _pusherService.subscribe(
      'private-conversation-$_conversationId',
      onEvent: _handlePusherEvent,
    );
  }

  void _handlePusherEvent(PusherEvent event) {
    final data = jsonDecode(event.data);

    switch (event.eventName) {
      case 'new-message':
        final message = Message.fromJson(data['message']);
        if (!_messages.any((m) => m.id == message.id)) {
          _messages.add(message);
          notifyListeners();
          _scrollToBottom();
          _markAsRead();
        }
        break;
      case 'message-read':
        // Update read status for our sent messages
        for (var i = 0; i < _messages.length; i++) {
          if (_messages[i].senderId == _currentUserId) {
            _messages[i] = Message(
              id: _messages[i].id,
              conversation: _messages[i].conversation,
              sender: _messages[i].sender,
              type: _messages[i].type,
              text: _messages[i].text,
              attachment: _messages[i].attachment,
              isRead: true,
              createdAt: _messages[i].createdAt,
            );
          }
        }
        notifyListeners();
        break;
      case 'client-typing-start':
        if (data['userId'] != _currentUserId) {
          _otherUserIsTyping = true;
          notifyListeners();
        }
        break;
      case 'client-typing-stop':
        if (data['userId'] != _currentUserId) {
          _otherUserIsTyping = false;
          notifyListeners();
        }
        break;
    }
  }

  Future<void> sendMessage() async {
    final text = textController.text.trim();
    if (text.isEmpty || _conversationId == null) return;

    textController.clear();
    _sendTypingStatus(false);

    try {
      // Optimistic update could be added here
      final message = await _chatRepo.sendTextMessage(_conversationId!, text);
      if (!_messages.any((m) => m.id == message.id)) {
        _messages.add(message);
        notifyListeners();
        _scrollToBottom();
      }
    } catch (e) {
      debugPrint("Send Message Error: $e");
    }
  }

  Future<void> sendVoiceMessage(String filePath) async {
    if (_conversationId == null) return;
    try {
      final message = await _chatRepo.sendFileMessage(
        conversationId: _conversationId!,
        type: 'voice',
        filePath: filePath,
      );
      _messages.add(message);
      notifyListeners();
      _scrollToBottom();
    } catch (e) {
      debugPrint("Send Voice Error: $e");
    }
  }

  Future<void> _markAsRead() async {
    if (_conversationId == null) return;
    try {
      await _chatRepo.markAsRead(_conversationId!);
    } catch (e) {
      debugPrint("Mark As Read Error: $e");
    }
  }

  void onTypingChanged(String value) {
    if (value.isNotEmpty && !_isTyping) {
      _isTyping = true;
      _sendTypingStatus(true);
    } else if (value.isEmpty && _isTyping) {
      _isTyping = false;
      _sendTypingStatus(false);
    }
  }

  Future<void> _sendTypingStatus(bool isTyping) async {
    if (_conversationId == null || _currentUserId == null) return;
    await _pusherService.trigger(PusherEvent(
      channelName: 'private-conversation-$_conversationId',
      eventName: isTyping ? 'client-typing-start' : 'client-typing-stop',
      data: jsonEncode({'userId': _currentUserId}),
    ));
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    if (_conversationId != null) {
      _pusherService.unsubscribe('private-conversation-$_conversationId');
    }
    textController.dispose();
    scrollController.dispose();
    _voiceRecorder.dispose();
    super.dispose();
  }

  // Voice Recording Methods
  Future<void> startRecording() => _voiceRecorder.startRecording();
  Future<String?> stopRecording() => _voiceRecorder.stopRecording();
  Future<void> cancelRecording() => _voiceRecorder.cancelRecording();
}
