import 'package:bloc/bloc.dart';
import 'package:bookify/Features/home/data/models/book_model/book_model.dart';
import 'package:bookify/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());


final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksInitial());
    var result = await homeRepo.fetchSimilarBooks( category: category);

    result.fold(
      (failure) {
        emit(SimilarBooksFailuer(failure.errorMessage));
      },

      (books) {
        emit(SimilarBooksSuccess(books));
      },
    );
  }
}