import 'package:sel3_app/Features/chats/data/models/message_model.dart';

abstract class ChatRepo {
  Future<String> createOrGetConversation({
    required String user1Id,
    required String user2Id,
  });
  Future<void> sendMessage(
    String conversationId,
    String senderId,
    String content,
  );
  Future<List<MessageModel>> getMessages(String conversationId);
  Stream<List<MessageModel>> listenMessages(String conversationId);
}
