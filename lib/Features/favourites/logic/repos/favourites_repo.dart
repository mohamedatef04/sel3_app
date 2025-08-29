import 'package:dartz/dartz.dart';
import 'package:sel3_app/Features/home/data/models/advertise_model.dart';
import 'package:sel3_app/core/errors/failures.dart';

abstract class FavouritesRepo {
  Future<void> addToFavourites({required String advertiseId});

  Future<Either<Failures, List<AdvertiseModel>>> getFavourites();

  Future<Either<Failures, void>> removeFromFavourites({
    required String advertiseId,
  });
}
