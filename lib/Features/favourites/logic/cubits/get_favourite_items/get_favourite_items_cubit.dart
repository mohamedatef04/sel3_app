import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/favourites/logic/repos/favourites_repo.dart';
import 'package:sel3_app/Features/home/data/models/advertise_model.dart';

part 'get_favourite_items_state.dart';

class GetFavouriteItemsCubit extends Cubit<GetFavouriteItemsState> {
  GetFavouriteItemsCubit(this.favouritesRepo)
    : super(GetFavouriteItemsInitial());

  final FavouritesRepo favouritesRepo;

  Future<void> getFavouriteItems() async {
    emit(GetFavouriteItemsLoadingState());
    final result = await favouritesRepo.getFavourites();
    result.fold(
      (l) => emit(GetFavouriteItemsFailureState(errorMessage: l.errorMessage)),
      (r) {
        if (r.isEmpty) {
          emit(GetFavouriteItemsEmptyState());
        } else {
          emit(GetFavouriteItemsSuccessState(myFavouriteItems: r));
        }
      },
    );
  }

  Future<void> removeFavouriteItem(String advertiseId) async {
    try {
      final result = await favouritesRepo.removeFromFavourites(
        advertiseId: advertiseId,
      );

      result.fold(
        (l) =>
            emit(GetFavouriteItemsFailureState(errorMessage: l.errorMessage)),
        (r) async {
          emit(RemoveFavouriteItemSuccessState());
          final res = await favouritesRepo.getFavourites();
          res.fold(
            (l) => emit(
              GetFavouriteItemsFailureState(errorMessage: l.errorMessage),
            ),
            (r) {
              if (r.isEmpty) {
                emit(GetFavouriteItemsEmptyState());
              } else {
                emit(GetFavouriteItemsAfterRemove(myFavouriteItems: r));
              }
            },
          );
        },
      );
    } on Exception catch (e) {
      emit(RemoveFavouriteItemFailureState(errorMessage: e.toString()));
    }
  }
}
