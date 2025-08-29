import 'package:dartz/dartz.dart';
import 'package:sel3_app/Features/home/data/models/advertise_model.dart';
import 'package:sel3_app/core/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<AdvertiseModel>>> getAllAdvertisements({
    required String category,
  });
  Future<Either<Failures, List<AdvertiseModel>>> getCategoryAdvertisements({
    required String category,
  });

  Future<Either<Failures, List<AdvertiseModel>>> getSpecialAdvertisements();
}
