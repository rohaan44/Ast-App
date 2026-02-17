class ConversationResponse {
  final bool success;
  final List<Conversation> conversations;

  ConversationResponse({required this.success, required this.conversations});

  factory ConversationResponse.fromJson(Map<String, dynamic> json) {
    return ConversationResponse(
      success: json['success'] ?? false,
      conversations: (json['data']['conversations'] as List?)
              ?.map((c) => Conversation.fromJson(c))
              .toList() ??
          [],
    );
  }
}

class Conversation {
  final String id;
  final List<ChatParticipant> participants;
  final Message? lastMessage;
  final DateTime? lastMessageAt;
  final int unreadCount;
  final DateTime createdAt;

  Conversation({
    required this.id,
    required this.participants,
    this.lastMessage,
    this.lastMessageAt,
    required this.unreadCount,
    required this.createdAt,
  });

  factory Conversation.fromJson(Map<String, dynamic> json) {
    return Conversation(
      id: json['_id'],
      participants: (json['participants'] as List?)
              ?.map((p) => ChatParticipant.fromJson(p))
              .toList() ??
          [],
      lastMessage: json['lastMessage'] != null
          ? Message.fromJson(json['lastMessage'])
          : null,
      lastMessageAt: json['lastMessageAt'] != null
          ? DateTime.parse(json['lastMessageAt'])
          : null,
      unreadCount: json['unreadCount'] ?? 0,
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  ChatParticipant getOtherParticipant(String currentUserId) {
    return participants.firstWhere((p) => p.id != currentUserId,
        orElse: () => participants.first);
  }
}

class ChatParticipant {
  final String id;
  final String email;
  final String? firstName;
  final String? lastName;
  final String role;
  final String? avatar;

  ChatParticipant({
    required this.id,
    required this.email,
    this.firstName,
    this.lastName,
    required this.role,
    this.avatar,
  });

  String get fullName => "${firstName ?? ''} ${lastName ?? ''}".trim();

  factory ChatParticipant.fromJson(Map<String, dynamic> json) {
    return ChatParticipant(
      id: json['_id'],
      email: json['email'] ?? '',
      firstName: json['firstName'],
      lastName: json['lastName'],
      role: json['role'] ?? '',
      avatar: json['avatar'],
    );
  }
}

class MessageResponse {
  final bool success;
  final List<Message> messages;
  final Pagination pagination;

  MessageResponse({
    required this.success,
    required this.messages,
    required this.pagination,
  });

  factory MessageResponse.fromJson(Map<String, dynamic> json) {
    return MessageResponse(
      success: json['success'] ?? false,
      messages: (json['data']['messages'] as List?)
              ?.map((m) => Message.fromJson(m))
              .toList() ??
          [],
      pagination: Pagination.fromJson(json['data']['pagination']),
    );
  }
}

class Message {
  final String id;
  final String? conversation;
  final dynamic sender; // Can be ID or ChatParticipant
  final String type;
  final String? text;
  final Attachment? attachment;
  final bool isRead;
  final DateTime createdAt;

  Message({
    required this.id,
    this.conversation,
    required this.sender,
    required this.type,
    this.text,
    this.attachment,
    required this.isRead,
    required this.createdAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['_id'],
      conversation: json['conversation'],
      sender: json['sender'] is Map<String, dynamic>
          ? ChatParticipant.fromJson(json['sender'])
          : json['sender'],
      type: json['type'] ?? 'text',
      text: json['text'],
      attachment: json['attachment'] != null
          ? Attachment.fromJson(json['attachment'])
          : null,
      isRead: json['isRead'] ?? false,
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  String get senderId {
    if (sender is ChatParticipant) {
      return (sender as ChatParticipant).id;
    }
    return sender.toString();
  }
}

class Attachment {
  final String url;
  final String? publicId;
  final String? filename;
  final int? size;
  final String? mimeType;
  final int? width;
  final int? height;
  final double? duration;

  Attachment({
    required this.url,
    this.publicId,
    this.filename,
    this.size,
    this.mimeType,
    this.width,
    this.height,
    this.duration,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      url: json['url'],
      publicId: json['publicId'],
      filename: json['filename'],
      size: json['size'],
      mimeType: json['mimeType'],
      width: json['width'],
      height: json['height'],
      duration: json['duration']?.toDouble(),
    );
  }
}

class Pagination {
  final int page;
  final int limit;
  final int total;
  final int pages;
  final bool hasMore;

  Pagination({
    required this.page,
    required this.limit,
    required this.total,
    required this.pages,
    required this.hasMore,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      page: json['page'] ?? 1,
      limit: json['limit'] ?? 50,
      total: json['total'] ?? 0,
      pages: json['pages'] ?? 1,
      hasMore: json['hasMore'] ?? false,
    );
  }
}

class ChatEligibleUser {
  final String id;
  final String name;
  final String email;
  final String role;
  final String relationshipId;
  final DateTime acceptedAt;

  ChatEligibleUser({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.relationshipId,
    required this.acceptedAt,
  });

  factory ChatEligibleUser.fromJson(Map<String, dynamic> json) {
    return ChatEligibleUser(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
      relationshipId: json['relationshipId'],
      acceptedAt: DateTime.parse(json['acceptedAt']),
    );
  }
}
