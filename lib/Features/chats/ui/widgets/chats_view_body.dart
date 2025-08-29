import 'package:flutter/material.dart';
import 'package:sel3_app/Features/chats/ui/widgets/chat_section_itme.dart';
import 'package:sel3_app/core/widgets/custom_app_bar.dart';

class ChatsViewBody extends StatelessWidget {
  const ChatsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'المحادثات'),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const ChatSectionItme();
        },
      ),
    );
  }
}
