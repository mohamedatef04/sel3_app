import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/publish_advertise/logic/repos/publish_advertise_repo.dart';

part 'publish_advertise_state.dart';

class PublishAdvertiseCubit extends Cubit<PublishAdvertiseState> {
  PublishAdvertiseCubit(this.publishAdvertiseRepo)
    : super(PublishAdvertiseInitial());

  final PublishAdvertiseRepo publishAdvertiseRepo;

  Future<void> publishAdvertise({
    required Map<String, dynamic> data,
  }) async {
    emit(PublishAdvertiseLoadingState());
    try {
      await publishAdvertiseRepo.publishAdvertise(
        data: data,
      );
      emit(PublishAdvertiseSuccessState());
    } catch (e) {
      emit(PublishAdvertiseFailureState(errorMessage: e.toString()));
    }
  }
}
