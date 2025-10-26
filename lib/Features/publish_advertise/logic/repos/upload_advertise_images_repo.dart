import 'dart:io';

abstract class UploadAdvertiseImagesRepo {
  Future<List<String>> uploadAdvertiseImges({
    required List<File> images,
  });
}
