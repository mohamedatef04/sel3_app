import 'package:flutter/material.dart';
import 'package:sel3_app/Features/chats/ui/widgets/chats_view_body.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});
  static const String routeName = '/chats';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChatsViewBody(),
    );
  }
}
