import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/auth/data/models/user_model.dart';
import 'package:sel3_app/Features/auth/logic/repos/auth_repo.dart';

part 'get_user_data_state.dart';

class GetUserDataCubit extends Cubit<GetUserDataState> {
  GetUserDataCubit(this.authRepo) : super(GetUserDataInitial());

  final AuthRepo authRepo;

  Future<void> getUserData() async {
    emit(GetUserDataLoadingState());
    final res = await authRepo.getCurrentUserData();
    res.fold(
      (l) => emit(GetUserDataFailureState(errorMessage: l.errorMessage)),
      (r) {
        emit(GetUserDataSuccessState(userModel: r));
      },
    );
  }
}
