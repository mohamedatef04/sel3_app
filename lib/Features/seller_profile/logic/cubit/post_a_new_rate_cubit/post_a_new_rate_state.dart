part of 'post_a_new_rate_cubit.dart';

abstract class PostANewRateState extends Equatable {
  const PostANewRateState();

  @override
  List<Object> get props => [];
}

class PostANewRateInitial extends PostANewRateState {}

class PostANewRateSuccessState extends PostANewRateState {}

class PostANewRateLoadingState extends PostANewRateState {}

class PostANewRateFailureState extends PostANewRateState {
  final String errorMessage;
  const PostANewRateFailureState({required this.errorMessage});
}
