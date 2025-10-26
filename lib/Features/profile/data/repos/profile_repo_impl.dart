import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sel3_app/Features/home/data/models/advertise_model.dart';
import 'package:sel3_app/Features/profile/data/models/rate_model.dart';
import 'package:sel3_app/Features/profile/logic/repos/profile_repo.dart';
import 'package:sel3_app/core/errors/failures.dart';
import 'package:sel3_app/core/network/constants.dart';
import 'package:sel3_app/core/services/api_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ApiService apiService;
  ProfileRepoImpl({required this.apiService});

  @override
  Future<Either<Failures, List<AdvertiseModel>>> getMyAdvertisements() async {
    try {
      final res = await apiService.getRequest(endpoint: allAdvertismentsTable);

      List<dynamic> jsonData = res.data;

      List<AdvertiseModel> allAdvertisements = jsonData
          .map((e) => AdvertiseModel.fromJson(e))
          .toList();

      List<AdvertiseModel> myAdvertisements = allAdvertisements
          .where(
            (element) =>
                element.userId == Supabase.instance.client.auth.currentUser?.id,
          )
          .toList();
      return Right(myAdvertisements);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExeption(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, List<RateModel>>> getMyRates() async {
    try {
      final res = await apiService.getRequest(endpoint: getMyRatesEndPoint);
      List<dynamic> jsonData = res.data;

      List<RateModel> allRates = jsonData
          .map((e) => RateModel.fromJson(e))
          .toList();

      List<RateModel> myRates = [];

      for (var element in allRates) {
        if (element.rates.isNotEmpty &&
            element.rates.any(
              (x) => x.to == Supabase.instance.client.auth.currentUser?.id,
            )) {
          myRates.add(element);
        } else {
          myRates.remove(element);
        }
      }

      return Right(myRates);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExeption(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
