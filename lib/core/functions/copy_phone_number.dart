import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> copyPhoneNumber({required String phone}) async {
  await Clipboard.setData(ClipboardData(text: phone));
  debugPrint("Phone number copied: $phone");
}
