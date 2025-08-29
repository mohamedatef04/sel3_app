import 'package:flutter/material.dart';
import 'package:sel3_app/Features/chats/ui/widgets/conversation_view_body.dart';

class ConversationView extends StatelessWidget {
  const ConversationView({
    super.key,
    required this.conversationId,
    required this.currentUserId,
  });
  static const routeName = '/conversation';
  final String conversationId;
  final String currentUserId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConversationViewBody(
        conversationId: conversationId,
        currentUserId: currentUserId,
      ),
    );
  }
}
