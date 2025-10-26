part of 'publish_advertise_cubit.dart';

abstract class PublishAdvertiseState extends Equatable {
  const PublishAdvertiseState();

  @override
  List<Object> get props => [];
}

class PublishAdvertiseInitial extends PublishAdvertiseState {}

class PublishAdvertiseLoadingState extends PublishAdvertiseState {}

class PublishAdvertiseSuccessState extends PublishAdvertiseState {}

class PublishAdvertiseFailureState extends PublishAdvertiseState {
  final String errorMessage;
  const PublishAdvertiseFailureState({required this.errorMessage});
}
