part of 'add_to_fav_cubit.dart';

abstract class AddToFavState extends Equatable {
  const AddToFavState();

  @override
  List<Object> get props => [];
}

class AddToFavInitial extends AddToFavState {}

class AddToFavSuccessState extends AddToFavState {}

class AddToFavFailureState extends AddToFavState {
  final String message;
  const AddToFavFailureState({required this.message});
}
