import 'package:sel3_app/Features/chats/data/models/message_model.dart';
import 'package:sel3_app/Features/chats/logic/repos/chat_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatRepoImpl implements ChatRepo {
  final SupabaseClient supabase;

  ChatRepoImpl({required this.supabase});

  @override
  Future<String> createOrGetConversation({
    required String user1Id,
    required String user2Id,
  }) async {
    final existing = await supabase
        .from('conversations')
        .select()
        .or(
          'and(user1_id.eq.$user1Id,user2_id.eq.$user2Id),and(user1_id.eq.$user2Id,user2_id.eq.$user1Id)',
        )
        .limit(1);

    if (existing.isNotEmpty) {
      return existing.first['id'];
    }

    final inserted = await supabase
        .from('conversations')
        .insert({
          'user1_id': user1Id,
          'user2_id': user2Id,
        })
        .select()
        .single();

    return inserted['id'];
  }

  @override
  Future<void> sendMessage(
    String conversationId,
    String senderId,
    String content,
  ) async {
    await supabase.from('messages').insert({
      'conversation_id': conversationId,
      'sender_id': senderId,
      'content': content,
      'created_at': DateTime.now().toIso8601String(),
    });
  }

  @override
  Future<List<MessageModel>> getMessages(String conversationId) async {
    final response = await supabase
        .from('messages')
        .select()
        .eq('conversation_id', conversationId)
        .order('created_at');

    return response
        .map<MessageModel>((json) => MessageModel.fromJson(json))
        .toList();
  }

  @override
  Stream<List<MessageModel>> listenMessages(String conversationId) {
    return supabase
        .from('messages')
        .stream(primaryKey: ['id'])
        .eq('conversation_id', conversationId)
        .order('created_at')
        .map(
          (data) => data
              .map<MessageModel>((json) => MessageModel.fromJson(json))
              .toList(),
        );
  }
}
