import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/chats/data/repos/chat_repo_impl.dart';
import 'package:sel3_app/Features/chats/logic/cubits/chat_cubit.dart';
import 'package:sel3_app/Features/chats/ui/widgets/message_input.dart';
import 'package:sel3_app/Features/chats/ui/widgets/reciever_message_bubble.dart';
import 'package:sel3_app/Features/chats/ui/widgets/sender_message_bubble.dart';
import 'package:sel3_app/core/services/get_it_service.dart';

class ConversationViewBody extends StatelessWidget {
  final String conversationId;
  final String currentUserId;

  const ConversationViewBody({
    super.key,
    required this.conversationId,
    required this.currentUserId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          ChatCubit(getIt.get<ChatRepoImpl>())..loadMessages(conversationId),
      child: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                if (state is ChatLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ChatLoaded) {
                  if (state.messages.isEmpty) {
                    return const Center(
                      child: Text(
                        "لا توجد رسائل بعد 👋",
                        style: TextStyle(color: Colors.grey),
                      ),
                    );
                  }

                  return ListView.builder(
                    reverse: true, // عشان آخر رسالة تظهر تحت
                    padding: const EdgeInsets.all(12),
                    itemCount: state.messages.length,
                    itemBuilder: (context, index) {
                      final msg = state.messages[index];
                      final isMe = msg.senderId == currentUserId;
                      return Align(
                        alignment: isMe
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: isMe
                            ? SenderMessageBubble(message: msg.content)
                            : ReceiverMessageBubble(message: msg.content),
                      );
                    },
                  );
                } else if (state is ChatError) {
                  return Center(child: Text(state.message));
                }
                return const SizedBox.shrink();
              },
            ),
          ),
          MessageInput(
            conversationId: conversationId,
            currentUserId: currentUserId,
          ),
        ],
      ),
    );
  }
}
