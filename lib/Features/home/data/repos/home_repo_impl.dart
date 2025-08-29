import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sel3_app/Features/home/data/models/advertise_model.dart';
import 'package:sel3_app/Features/home/logic/repos/home_repo.dart';
import 'package:sel3_app/core/errors/failures.dart';
import 'package:sel3_app/core/network/constants.dart';
import 'package:sel3_app/core/services/api_service.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  HomeRepoImpl({required this.apiService});

  @override
  Future<Either<Failures, List<AdvertiseModel>>> getAllAdvertisements({
    required String category,
  }) async {
    try {
      final res = await apiService.getRequest(
        endpoint: '$allAdvertismentsTable?$category',
      );

      List<dynamic> jsonData = res.data;

      List<AdvertiseModel> allAdvertisements = jsonData
          .map(
            (e) => AdvertiseModel.fromJson(e),
          )
          .toList();

      return Right(allAdvertisements);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExeption(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, List<AdvertiseModel>>>
  getSpecialAdvertisements() async {
    try {
      final res = await apiService.getRequest(endpoint: allAdvertismentsTable);

      List<dynamic> jsonData = res.data;

      List<AdvertiseModel> allAdvertisements = jsonData
          .map(
            (e) => AdvertiseModel.fromJson(e),
          )
          .toList();
      List<AdvertiseModel> specialAdvertisment = allAdvertisements
          .where((element) => element.isSpecial == true)
          .toList();
      return Right(specialAdvertisment);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExeption(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, List<AdvertiseModel>>> getCategoryAdvertisements({
    required String category,
  }) async {
    try {
      final res = await apiService.getRequest(endpoint: allAdvertismentsTable);

      List<dynamic> jsonData = res.data;

      List<AdvertiseModel> allAdvertisements = jsonData
          .map(
            (e) => AdvertiseModel.fromJson(e),
          )
          .toList();

      List<AdvertiseModel> categoryAdvertisements = allAdvertisements
          .where((element) => element.category == category)
          .toList();

      return Right(categoryAdvertisements);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExeption(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
