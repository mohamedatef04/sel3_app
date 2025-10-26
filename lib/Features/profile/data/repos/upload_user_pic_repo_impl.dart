import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:sel3_app/Features/profile/logic/repos/upload_user_pic_repo.dart';
import 'package:sel3_app/core/errors/custom_exeption.dart';
import 'package:sel3_app/core/network/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UploadUserPicRepoImpl implements UploadUserPicRepo {
  final SupabaseClient supabase;

  UploadUserPicRepoImpl({required this.supabase});

  @override
  Future<String> uploadUserPic({required File image}) async {
    try {
      final userId = supabase.auth.currentUser?.id;
      if (userId == null) {
        throw Exception('لم يتم العثور على المستخدم الحالي');
      }

      final fileName =
          '${DateTime.now().millisecondsSinceEpoch}_${path.basename(image.path)}';
      final fileBytes = await image.readAsBytes();

      final storagePath = '$userId/$fileName';

      await supabase.storage
          .from(usersImagesBucket)
          .uploadBinary(storagePath, fileBytes);

      final url = supabase.storage
          .from(usersImagesBucket)
          .getPublicUrl(storagePath);

      return url;
    } on Exception catch (e) {
      throw CustomExeption(errorMessage: e.toString());
    }
  }
}
