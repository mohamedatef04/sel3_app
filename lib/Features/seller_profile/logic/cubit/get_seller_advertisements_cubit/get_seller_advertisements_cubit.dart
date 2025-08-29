import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/home/data/models/advertise_model.dart';
import 'package:sel3_app/Features/seller_profile/logic/repos/seller_profile_repo.dart';

part 'get_seller_advertisements_state.dart';

class GetSellerAdvertisementsCubit extends Cubit<GetSellerAdvertisementsState> {
  GetSellerAdvertisementsCubit(this.sellerProfileRepo)
    : super(GetSellerAdvertisementsInitial());

  final SellerProfileRepo sellerProfileRepo;

  Future<void> getSellerAdvertisements({required String sellerId}) async {
    emit(GetSellerAdvertisementsLoadingState());
    final result = await sellerProfileRepo.getSellerAdvertisements(
      sellerId: sellerId,
    );
    result.fold(
      (l) => emit(
        GetSellerAdvertisementsFailureState(errorMessage: l.errorMessage),
      ),
      (r) {
        if (r.isEmpty) {
          emit(GetSellerAdvertisementsEmptyState());
        } else {
          emit(GetSellerAdvertisementsSuccessState(advertisementsList: r));
        }
      },
    );
  }
}
