import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sel3_app/Features/favourites/logic/repos/favourites_repo.dart';

part 'add_to_fav_state.dart';

class AddToFavCubit extends Cubit<AddToFavState> {
  AddToFavCubit(this.favouritesRepo) : super(AddToFavInitial());

  final FavouritesRepo favouritesRepo;

  Future<void> addToFavourites({required String advertiseId}) async {
    try {
      await favouritesRepo.addToFavourites(advertiseId: advertiseId);
      emit(AddToFavSuccessState());
    } catch (e) {
      emit(AddToFavFailureState(message: e.toString()));
    }
  }
}
