import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sel3_app/Features/home/data/models/advertise_model.dart';
import 'package:sel3_app/Features/profile/data/models/rate_model.dart';
import 'package:sel3_app/Features/seller_profile/logic/repos/seller_profile_repo.dart';
import 'package:sel3_app/core/errors/failures.dart';
import 'package:sel3_app/core/network/constants.dart';
import 'package:sel3_app/core/services/api_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SellerProfileRepoImpl implements SellerProfileRepo {
  final ApiService apiService;
  SellerProfileRepoImpl({required this.apiService});
  @override
  Future<Either<Failures, List<AdvertiseModel>>> getSellerAdvertisements({
    required String sellerId,
  }) async {
    try {
      final res = await apiService.getRequest(endpoint: allAdvertismentsTable);

      List<dynamic> jsonData = res.data;

      List<AdvertiseModel> allAdvertisements = jsonData
          .map((e) => AdvertiseModel.fromJson(e))
          .toList();

      List<AdvertiseModel> myAdvertisements = allAdvertisements
          .where(
            (element) => element.userId == sellerId,
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
  Future<Either<Failures, List<SingleRate>>> getSellerRates({
    required String sellerId,
  }) async {
    try {
      final res = await apiService.getRequest(endpoint: getMyRatesEndPoint);
      List<dynamic> jsonData = res.data;

      List<RateModel> allRates = jsonData
          .map((e) => RateModel.fromJson(e))
          .toList();

      List<SingleRate> sellerRates = [];

      for (var element in allRates) {
        sellerRates.addAll(
          element.rates.where((rate) => rate.to == sellerId),
        );
      }

      return Right(sellerRates);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExeption(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<void> postANewRate({required SingleRate rate}) async {
    try {
      await apiService.postRequest(
        endpoint: ratesTable,
        data: {
          'rate_value': rate.rateValue,
          'from': Supabase.instance.client.auth.currentUser?.id,
          'to': rate.to,
          'comment': rate.comment,
        },
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
