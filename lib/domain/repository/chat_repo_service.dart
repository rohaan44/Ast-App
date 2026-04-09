import 'package:ast_official/data/repository/chat_repo.dart';
import 'package:ast_official/data/models/chat_models.dart';

class ChatRepoService {
  final ChatRepo chatRepo;

  ChatRepoService({required this.chatRepo});

  // ================= CONVERSATIONS =================

  Future<List<Conversation>> getConversations() async {
    return chatRepo.getConversations();
  }

  Future<Conversation> createConversation(String participantId) async {
    return chatRepo.createConversation(participantId);
  }

  // ================= MESSAGES =================

  Future<MessageResponse> getMessages(
    String conversationId, {
    int page = 1,
    int limit = 50,
    String? before,
  }) async {
    return chatRepo.getMessages(
      conversationId,
      page: page,
      limit: limit,
      before: before,
    );
  }

  Future<Message> sendTextMessage(
      String conversationId, String text) async {
    return chatRepo.sendTextMessage(conversationId, text);
  }

  Future<Message> sendFileMessage({
    required String conversationId,
    required String type,
    required String filePath,
  }) async {
    return chatRepo.sendFileMessage(
      conversationId: conversationId,
      type: type,
      filePath: filePath,
    );
  }

  Future<void> markConversationAsRead(String conversationId) async {
    return chatRepo.markAsRead(conversationId);
  }

  Future<void> deleteMessage(String messageId) async {
    return chatRepo.deleteMessage(messageId);
  }

  Future<int> getTotalUnreadCount() async {
    return chatRepo.getTotalUnreadCount();
  }

  // ================= RELATIONSHIPS =================

  Future<List<ChatEligibleUser>> getChatEligibleUsers() async {
    return chatRepo.getChatEligibleUsers();
  }
}
