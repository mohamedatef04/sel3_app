import 'package:dartz/dartz.dart';
import 'package:sel3_app/Features/home/data/models/advertise_model.dart';
import 'package:sel3_app/Features/profile/data/models/rate_model.dart';
import 'package:sel3_app/core/errors/failures.dart';

abstract class SellerProfileRepo {
  Future<Either<Failures, List<AdvertiseModel>>> getSellerAdvertisements({
    required String sellerId,
  });
  Future<Either<Failures, List<SingleRate>>> getSellerRates({
    required String sellerId,
  });

  Future<void> postANewRate({required SingleRate rate});
}
