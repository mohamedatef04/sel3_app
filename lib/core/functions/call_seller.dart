import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> callSeller({required String phone}) async {
  final Uri uri = Uri(
    scheme: 'tel',
    path: '+2$phone',
  );
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    debugPrint('Could not launch phone dialer');
  }
}
