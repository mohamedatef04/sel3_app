import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sel3_app/Features/chats/ui/views/conversation_view.dart';
import 'package:sel3_app/core/theme/app_styles.dart';

class ChatSectionItme extends StatelessWidget {
  const ChatSectionItme({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: GestureDetector(
          onTap: () {
            GoRouter.of(context).push(ConversationView.routeName);
          },
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 25.r,
                  backgroundImage: const NetworkImage(
                    'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                ),
                title: Text(
                  'محمد محمد',
                  style: AppStyles.black18.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'هذا النص هو مثال لنص يمكن ان يستبدل في نفس المساحة',
                  style: AppStyles.white16.copyWith(color: Colors.grey),
                ),
                trailing: Text(
                  '10:30',
                  style: AppStyles.white16.copyWith(color: Colors.grey),
                ),
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
