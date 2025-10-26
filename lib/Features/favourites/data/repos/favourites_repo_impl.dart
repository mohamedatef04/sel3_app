import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sel3_app/Features/favourites/logic/repos/favourites_repo.dart';
import 'package:sel3_app/Features/home/data/models/advertise_model.dart';
import 'package:sel3_app/core/errors/failures.dart';
import 'package:sel3_app/core/network/constants.dart';
import 'package:sel3_app/core/services/api_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FavouritesRepoImpl implements FavouritesRepo {
  final ApiService apiService;

  FavouritesRepoImpl({required this.apiService});
  @override
  Future<void> addToFavourites({required String advertiseId}) async {
    try {
      await apiService.postRequest(
        endpoint: favouritesTable,
        data: {
          'for_advertise': advertiseId,
          'for_user': Supabase.instance.client.auth.currentUser!.id,
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

  @override
  Future<Either<Failures, List<AdvertiseModel>>> getFavourites() async {
    try {
      final res = await apiService.getRequest(
        endpoint: myFavouritesAdvertisementsEndPoint,
      );

      List<dynamic> jsonData = res.data;
      List<AdvertiseModel> allFavourites = jsonData
          .map((e) => AdvertiseModel.fromJson(e))
          .toList();

      final favsForSpecificUser = allFavourites.where((advertise) {
        final favs = advertise.favourites;
        return favs!.isNotEmpty &&
            favs.any(
              (x) =>
                  x['for_user'] ==
                  Supabase.instance.client.auth.currentUser!.id,
            );
      }).toList();
      return Right(favsForSpecificUser);
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioExeption(e);
      } else {
        throw ServerFailure(errorMessage: e.toString());
      }
    }
  }

  @override
  Future<Either<Failures, void>> removeFromFavourites({
    required String advertiseId,
  }) async {
    try {
      await apiService.deleteRequest(
        endpoint:
            '$favouritesTable?for_advertise=eq.$advertiseId&for_user=eq.${Supabase.instance.client.auth.currentUser!.id}',
      );

      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExeption(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
