import 'dart:io';

abstract class UploadUserPicRepo {
  Future<String> uploadUserPic({required File image});
}
