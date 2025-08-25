import 'package:bloc/bloc.dart';
import 'package:bookify/Features/home/data/models/book_model/book_model.dart';
import 'package:bookify/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_book_state.dart';

class SearchBookCubit extends Cubit<SearchBookState> {
  SearchBookCubit(this.homeRepo) : super(SearchBookInitial());


  final HomeRepo homeRepo;

  Future<void> fetchSearchedBooks(String query) async {
    emit(SearchBookInitial());

    var result = await homeRepo.fetchSearchedBooks(bookName: query);
    result.fold(
      (failure) {
        emit(SearchBookFailure(failure.errorMessage));
      },
      (books) {
        emit(SearchBookSuccess(books));
      },
    );
  }



}
