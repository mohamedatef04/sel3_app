import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/home/data/models/advertise_model.dart';
import 'package:sel3_app/Features/search/logic/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;

  Future<void> getAllSearchItems() async {
    emit(SearchLoadingState());
    try {
      final advertisements = await searchRepo.allSearchItems();
      if (advertisements.isEmpty) {
        emit(SearchEmptyState());
      } else {
        emit(AllSearchItemsSuccessState(advertismentsList: advertisements));
      }
    } catch (e) {
      emit(SearchFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> getSearchItems({required String query}) async {
    emit(SearchLoadingState());
    try {
      final advertisements = await searchRepo.getSearchItems(query: query);
      if (advertisements.isEmpty) {
        emit(SearchEmptyState());
      } else {
        emit(SearchItemsSuccessState(advertismentsList: advertisements));
      }
    } catch (e) {
      emit(SearchFailureState(errorMessage: e.toString()));
    }
  }
}
