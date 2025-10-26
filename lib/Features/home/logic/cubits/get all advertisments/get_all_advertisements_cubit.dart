import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/home/data/models/advertise_model.dart';
import 'package:sel3_app/Features/home/logic/repos/home_repo.dart';

part 'get_all_advertisements_state.dart';

class GetAllAdvertisementsCubit extends Cubit<GetAllAdvertisementsState> {
  GetAllAdvertisementsCubit(this.homeRepo)
    : super(GetAllAdvertisementsInitial());

  final HomeRepo homeRepo;

  Future<void> getAllAdvertisements({required String category}) async {
    emit(GetAllAdvertisementsLoadingState());
    final result = await homeRepo.getAllAdvertisements(category: category);
    result.fold(
      (l) =>
          emit(GetAllAdvertisementsFailureState(errorMessage: l.errorMessage)),
      (r) {
        if (r.isEmpty) {
          emit(GetAllAdvertisementsEmptyState());
        } else {
          emit(GetAllAdvertisementsSuccessState(allAdvertisementsList: r));
        }
      },
    );
  }
}
