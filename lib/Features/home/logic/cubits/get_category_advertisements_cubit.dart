import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/home/data/models/advertise_model.dart';
import 'package:sel3_app/Features/home/logic/repos/home_repo.dart';

part 'get_category_advertisements_state.dart';

class GetCategoryAdvertisementsCubit
    extends Cubit<GetCategoryAdvertisementsState> {
  GetCategoryAdvertisementsCubit(this.homeRepo)
    : super(GetCategoryAdvertisementsInitial());
  final HomeRepo homeRepo;

  Future<void> getCategoryAdvertisements({required String category}) async {
    emit(GetCategoryAdvertisementsLoadingState());
    final result = await homeRepo.getCategoryAdvertisements(category: category);
    result.fold(
      (l) => emit(
        GetCategoryAdvertisementsFailureState(errorMessage: l.errorMessage),
      ),
      (r) => emit(
        GetCategoryAdvertisementsSuccessState(categoryAdvertisements: r),
      ),
    );
  }
}
