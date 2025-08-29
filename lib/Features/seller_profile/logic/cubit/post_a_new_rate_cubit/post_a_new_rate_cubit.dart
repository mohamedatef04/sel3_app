import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/profile/data/models/rate_model.dart';
import 'package:sel3_app/Features/seller_profile/logic/repos/seller_profile_repo.dart';

part 'post_a_new_rate_state.dart';

class PostANewRateCubit extends Cubit<PostANewRateState> {
  PostANewRateCubit(this.sellerProfileRepo) : super(PostANewRateInitial());
  final SellerProfileRepo sellerProfileRepo;

  Future<void> postANewRate({required SingleRate rate}) async {
    emit(PostANewRateLoadingState());
    try {
      await sellerProfileRepo.postANewRate(rate: rate);
      emit(PostANewRateSuccessState());
    } on Exception catch (e) {
      emit(PostANewRateFailureState(errorMessage: e.toString()));
    }
  }
}
