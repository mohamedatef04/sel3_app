import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/home/data/models/advertise_model.dart';
import 'package:sel3_app/Features/home/logic/repos/home_repo.dart';

part 'get_special_advertisements_state.dart';

class GetSpecialAdvertisementsCubit
    extends Cubit<GetSpecialAdvertisementsState> {
  GetSpecialAdvertisementsCubit(this.homeRepo)
    : super(GetSpecialAdvertisementsInitial());

  final HomeRepo homeRepo;

  Future<void> getSpecialAdvertisements() async {
    emit(GetSpecialAdvertisementsLoadingState());
    final result = await homeRepo.getSpecialAdvertisements();
    result.fold(
      (l) => emit(
        GetSpecialAdvertisementsFailureState(errorMessage: l.errorMessage),
      ),
      (r) =>
          emit(GetSpecialAdvertisementsSuccessState(specialAdvertisements: r)),
    );
  }
}
