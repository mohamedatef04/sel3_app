import 'package:dio/dio.dart';
import 'package:sel3_app/Features/publish_advertise/logic/repos/publish_advertise_repo.dart';
import 'package:sel3_app/core/errors/failures.dart';
import 'package:sel3_app/core/network/constants.dart';
import 'package:sel3_app/core/services/api_service.dart';

class PublishAdvertiseRepoImpl implements PublishAdvertiseRepo {
  final ApiService apiService;

  PublishAdvertiseRepoImpl({required this.apiService});
  @override
  Future<void> publishAdvertise({required Map<String, dynamic> data}) async {
    try {
      await apiService.postRequest(
        endpoint: allAdvertismentsTable,
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
