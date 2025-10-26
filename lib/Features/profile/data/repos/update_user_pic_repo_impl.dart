import 'package:dio/dio.dart';
import 'package:sel3_app/Features/profile/logic/repos/update_user_pic_repo.dart';
import 'package:sel3_app/core/errors/failures.dart';
import 'package:sel3_app/core/network/constants.dart';
import 'package:sel3_app/core/services/api_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UpdateUserPicRepoImpl implements UpdateUserPicRepo {
  final ApiService apiService;
  UpdateUserPicRepoImpl({required this.apiService});
  @override
  Future<void> updateUserPic({required Map<String, dynamic> data}) async {
    try {
      await apiService.updateRequest(
        endpoint:
            '$usersTable?user_id=eq.${Supabase.instance.client.auth.currentUser!.id}',
        data: data,
      );
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioExeption(e);
      } else {
        throw ServerFailure(errorMessage: e.toString());
      }
    }
  }
}
