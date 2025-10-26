import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/profile/logic/repos/update_user_pic_repo.dart';

part 'update_user_pic_state.dart';

class UpdateUserPicCubit extends Cubit<UpdateUserPicState> {
  UpdateUserPicCubit(this.updateUserPicRepo) : super(UpdateUserPicInitial());

  final UpdateUserPicRepo updateUserPicRepo;

  Future<void> updateUserPic({required Map<String, dynamic> data}) async {
    try {
      await updateUserPicRepo.updateUserPic(data: data);
      emit(UpdateUserPicSuccessState());
    } catch (e) {
      emit(UpdateUserPicFailureState(errorMessage: e.toString()));
    }
  }
}
