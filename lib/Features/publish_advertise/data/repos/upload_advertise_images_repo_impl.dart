import 'dart:io';
import 'package:sel3_app/Features/publish_advertise/logic/repos/upload_advertise_images_repo.dart';
import 'package:sel3_app/core/network/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as path;

class UploadAdvertiseImagesRepoImpl implements UploadAdvertiseImagesRepo {
  final SupabaseClient supabase;

  UploadAdvertiseImagesRepoImpl(this.supabase);

  @override
  Future<List<String>> uploadAdvertiseImges({
    required List<File> images,
  }) async {
    try {
      final userId = supabase.auth.currentUser?.id;
      if (userId == null) {
        throw Exception('لم يتم العثور على المستخدم الحالي');
      }

      List<String> imageUrls = [];

      for (var image in images) {
        final fileName =
            '${DateTime.now().millisecondsSinceEpoch}_${path.basename(image.path)}';
        final fileBytes = await image.readAsBytes();

        // Save inside folder named with the userId
        final storagePath = '$userId/$fileName';

        await supabase.storage
            .from(advertiseImagesBucket)
            .uploadBinary(storagePath, fileBytes);

        final url = supabase.storage
            .from(advertiseImagesBucket)
            .getPublicUrl(storagePath);

        imageUrls.add(url);
      }

      return imageUrls;
    } catch (e) {
      throw Exception('خطأ أثناء رفع الصور: $e');
    }
  }
}
