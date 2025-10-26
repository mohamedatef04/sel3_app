import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/auth/data/models/user_model.dart';
import 'package:sel3_app/Features/auth/logic/repos/auth_repo.dart';

part 'get_rater_info_state.dart';

class GetRaterInfoCubit extends Cubit<GetRaterInfoState> {
  GetRaterInfoCubit(this.authRepo) : super(GetRaterInfoInitial());
  final AuthRepo authRepo;

  Future<void> getRaterInfo({required String userId}) async {
    emit(GetRaterInfoLoadingState());
    final res = await authRepo.getSellerData(userId: userId);
    res.fold(
      (l) => emit(GetRaterInfoFailureState(errorMessage: l.errorMessage)),
      (r) => emit(GetRaterInfoSuccessState(userModel: r)),
    );
  }
}
