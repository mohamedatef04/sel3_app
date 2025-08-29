import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/profile/data/models/rate_model.dart';
import 'package:sel3_app/Features/seller_profile/logic/repos/seller_profile_repo.dart';

part 'get_seller_rates_state.dart';

class GetSellerRatesCubit extends Cubit<GetSellerRatesState> {
  GetSellerRatesCubit(this.sellerProfileRepo) : super(GetSellerRatesInitial());

  final SellerProfileRepo sellerProfileRepo;

  Future<void> getSellerRates({required String sellerId}) async {
    emit(GetSellerRatesLoadingState());
    final result = await sellerProfileRepo.getSellerRates(sellerId: sellerId);
    result.fold(
      (l) => emit(GetSellerRatesFailureState(errorMessage: l.errorMessage)),
      (r) {
        if (r.isEmpty) {
          emit(GetSellerRatesEmptyState());
        } else {
          emit(GetSellerRatesSuccessState(myRatesList: r));
        }
      },
    );
  }
}
