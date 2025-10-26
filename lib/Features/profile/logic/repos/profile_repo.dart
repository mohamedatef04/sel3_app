import 'package:dartz/dartz.dart';
import 'package:sel3_app/Features/home/data/models/advertise_model.dart';
import 'package:sel3_app/Features/profile/data/models/rate_model.dart';
import 'package:sel3_app/core/errors/failures.dart';

abstract class ProfileRepo {
  Future<Either<Failures, List<AdvertiseModel>>> getMyAdvertisements();

  Future<Either<Failures, List<RateModel>>> getMyRates();
}
