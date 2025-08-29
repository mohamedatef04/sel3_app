import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/auth/data/models/user_model.dart';
import 'package:sel3_app/Features/auth/logic/repos/auth_repo.dart';

part 'get_seller_data_state.dart';

class GetSellerDataCubit extends Cubit<GetSellerDataState> {
  GetSellerDataCubit(this.authRepo) : super(GetSellerDataInitial());

  final AuthRepo authRepo;

  Future<void> getSellerData({required String userId}) async {
    emit(GetSellerDataLoadingState());
    final res = await authRepo.getSellerData(userId: userId);
    res.fold(
      (l) => emit(GetSellerDataErrorState(errorMessage: l.errorMessage)),
      (r) => emit(GetSellerDataSuccessState(userModel: r)),
    );
  }
}
