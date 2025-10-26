import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/home/data/models/advertise_model.dart';
import 'package:sel3_app/Features/profile/logic/repos/profile_repo.dart';

part 'show_my_advertisements_state.dart';

class ShowMyAdvertisementsCubit extends Cubit<ShowMyAdvertisementsState> {
  ShowMyAdvertisementsCubit(this.profileRepo)
    : super(ShowMyAdvertisementsInitial());

  final ProfileRepo profileRepo;

  Future<void> getMyAdvertisements() async {
    emit(ShowMyAdvertisementsLoadingState());
    final res = await profileRepo.getMyAdvertisements();
    res.fold(
      (l) =>
          emit(ShowMyAdvertisementsFailureState(errorMessage: l.errorMessage)),
      (r) {
        if (r.isEmpty) {
          emit(ShowMyAdvertisementsEmptyState());
        } else {
          emit(ShowMyAdvertisementsSuccessState(myAdvertisementsList: r));
        }
      },
    );
  }
}
