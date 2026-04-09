import 'dart:convert';
import 'package:ast_official/core/network/auth_service/auth_service.dart';
import 'package:ast_official/data/models/chat_models.dart';
import 'package:ast_official/data/repository/chat_repo.dart';
import 'package:ast_official/services/pusher_service.dart';
import 'package:flutter/material.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class CoachChatController with ChangeNotifier {
  final ChatRepo _chatRepo = ChatRepo();
  final PusherService _pusherService = PusherService();

  List<Conversation> _conversations = [];
  List<Conversation> get conversations => _conversations;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _currentUserId;
  String? get currentUserId => _currentUserId;

  int _totalUnreadCount = 0;
  int get totalUnreadCount => _totalUnreadCount;

  CoachChatController() {
    _init();
  }

  Future<void> _init() async {
    _currentUserId = await AuthStorage.getUserId();
    await loadConversations();
    await _initPusher();
    await loadTotalUnreadCount();
  }

  Future<void> _initPusher() async {
    if (_currentUserId == null) return;
    await _pusherService.init();
    await _pusherService.subscribe(
      'private-user-$_currentUserId',
      onEvent: (event) {
        if (event.eventName == 'conversation-updated') {
          _handleConversationUpdated(event);
        }
      },
    );
  }

  Future<void> loadConversations() async {
    if (_isLoading) return;
    _setLoading(true);
    try {
      _conversations = await _chatRepo.getConversations();
      notifyListeners();
    } catch (e) {
      debugPrint("Load Conversations Error: $e");
    } finally {
      _setLoading(false);
    }
  }

  Future<void> loadTotalUnreadCount() async {
    try {
      _totalUnreadCount = await _chatRepo.getTotalUnreadCount();
      notifyListeners();
    } catch (e) {
      debugPrint("Load Unread Count Error: $e");
    }
  }

  void _handleConversationUpdated(PusherEvent event) {
    final data = jsonDecode(event.data);
    final String convId = data['conversationId'];
    final int unreadCount = data['unreadCount'];
    final message = Message.fromJson(data['lastMessage']);

    final index = _conversations.indexWhere((c) => c.id == convId);
    if (index != -1) {
      final oldConv = _conversations[index];
      _conversations[index] = Conversation(
        id: oldConv.id,
        participants: oldConv.participants,
        lastMessage: message,
        lastMessageAt: message.createdAt,
        unreadCount: unreadCount,
        createdAt: oldConv.createdAt,
      );
      final conv = _conversations.removeAt(index);
      _conversations.insert(0, conv);
    } else {
      loadConversations();
    }
    loadTotalUnreadCount();
    notifyListeners();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  List<Map<String, dynamic>> get chats {
    return _conversations.map((c) {
      final other = c.getOtherParticipant(_currentUserId ?? "");
      return {
        "id": c.id,
        "name": other.fullName.isEmpty ? other.email : other.fullName,
        "message": c.lastMessage?.text ?? "File attachment",
        "time": _formatTimestamp(c.lastMessageAt ?? c.createdAt),
        "image": other.avatar ??
            "https://ui-avatars.com/api/?name=${other.fullName}",
        "unread": c.unreadCount,
        "isOnline": false, // TODO: Implement presence tracking
      };
    }).toList();
  }

  String _formatTimestamp(DateTime dateTime) {
    final now = DateTime.now();
    final diff = now.difference(dateTime);
    if (diff.inDays == 0) {
      return "${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}";
    } else if (diff.inDays < 7) {
      return "${diff.inDays}d ago";
    } else {
      return "${dateTime.day}/${dateTime.month}";
    }
  }

  @override
  void dispose() {
    _pusherService.disconnect();
    super.dispose();
  }
}
