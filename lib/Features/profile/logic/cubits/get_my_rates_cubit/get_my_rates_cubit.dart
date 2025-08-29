import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/profile/data/models/rate_model.dart';
import 'package:sel3_app/Features/profile/logic/repos/profile_repo.dart';

part 'get_my_rates_state.dart';

class GetMyRatesCubit extends Cubit<GetMyRatesState> {
  GetMyRatesCubit(this.profileRepo) : super(GetMyRatesInitial());

  final ProfileRepo profileRepo;

  Future<void> getMyRates() async {
    emit(GetMyRatesLoadingState());
    final res = await profileRepo.getMyRates();
    res.fold(
      (l) => emit(GetMyRatesFailureState(errorMessage: l.errorMessage)),
      (r) {
        if (r.isEmpty) {
          emit(GetMyRatesEmptyState());
        } else {
          emit(GetMyRatesSuccessState(myRatesList: r));
        }
      },
    );
  }
}
