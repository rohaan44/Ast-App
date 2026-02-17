import 'package:ast_official/core/network/network_properties/network_properties.dart';
import 'package:ast_official/core/network/network_services/dio_helper.dart';
import 'package:ast_official/data/models/chat_models.dart';
import 'package:dio/dio.dart';

class ChatRepo {
  static final DioHelper _dioHelper = DioHelper();

  Future<List<Conversation>> getConversations() async {
    final response = await _dioHelper.get(
      url: "${NetworkProperties.baseUrl}chat/conversations",
      isAuthRequired: true,
    );
    return ConversationResponse.fromJson(response).conversations;
  }

  Future<Conversation> createConversation(String participantId) async {
    final response = await _dioHelper.post(
      url: "${NetworkProperties.baseUrl}chat/conversations",
      isAuthRequired: true,
      requestBody: {"participantId": participantId},
    );
    return Conversation.fromJson(response['data']['conversation']);
  }

  Future<MessageResponse> getMessages(String conversationId,
      {int page = 1, int limit = 50, String? before}) async {
    final Map<String, dynamic> queryParams = {
      "page": page,
      "limit": limit,
    };
    if (before != null) {
      queryParams["before"] = before;
    }

    final response = await _dioHelper.get(
      url:
          "${NetworkProperties.baseUrl}chat/conversations/$conversationId/messages",
      isAuthRequired: true,
      queryParameters: queryParams,
    );
    return MessageResponse.fromJson(response);
  }

  Future<Message> sendTextMessage(String conversationId, String text) async {
    final response = await _dioHelper.post(
      url: "${NetworkProperties.baseUrl}chat/messages",
      isAuthRequired: true,
      requestBody: {
        "conversationId": conversationId,
        "text": text,
      },
    );
    return Message.fromJson(response['data']['message']);
  }

  Future<Message> sendFileMessage({
    required String conversationId,
    required String type,
    required String filePath,
  }) async {
    final formData = FormData.fromMap({
      'conversationId': conversationId,
      'type': type,
      'file': await MultipartFile.fromFile(
        filePath,
        filename: filePath.split('/').last,
      ),
    });

    final response = await _dioHelper.post(
      url: "${NetworkProperties.baseUrl}chat/messages/file",
      isAuthRequired: true,
      isMultipart: true,
      formData: formData,
    );
    return Message.fromJson(response['data']['message']);
  }

  Future<void> markAsRead(String conversationId) async {
    await _dioHelper.put(
      url:
          "${NetworkProperties.baseUrl}chat/conversations/$conversationId/read",
      isAuthRequired: true,
    );
  }

  Future<int> getTotalUnreadCount() async {
    final response = await _dioHelper.get(
      url: "${NetworkProperties.baseUrl}chat/unread-count",
      isAuthRequired: true,
    );
    return response['data']['totalUnread'] ?? 0;
  }

  Future<void> deleteMessage(String messageId) async {
    await _dioHelper.delete(
      url: "${NetworkProperties.baseUrl}chat/messages/$messageId",
    );
  }

  Future<List<ChatEligibleUser>> getChatEligibleUsers() async {
    final response = await _dioHelper.get(
      url: "${NetworkProperties.baseUrl}relationships/chat-eligible",
      isAuthRequired: true,
    );
    return (response['data'] as List?)
            ?.map((u) => ChatEligibleUser.fromJson(u))
            .toList() ??
        [];
  }
}
