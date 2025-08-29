import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/chats/logic/cubits/chat_cubit.dart';

class MessageInput extends StatefulWidget {
  final String conversationId;
  final String currentUserId;

  const MessageInput({
    super.key,
    required this.conversationId,
    required this.currentUserId,
  });

  @override
  State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: "اكتب رسالتك...",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              final text = controller.text.trim();
              if (text.isNotEmpty) {
                context.read<ChatCubit>().sendMessage(
                  widget.conversationId,
                  widget.currentUserId,
                  text,
                );
                controller.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
