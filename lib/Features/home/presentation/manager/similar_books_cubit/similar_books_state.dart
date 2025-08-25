part of 'similar_books_cubit.dart';

sealed class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

final class SimilarBooksInitial extends SimilarBooksState {}

final class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookModel> books;

  const SimilarBooksSuccess(this.books);
}

final class SimilarBooksLoading extends SimilarBooksState {}

final class SimilarBooksFailuer extends SimilarBooksState {
  final String errorMessage;
  const SimilarBooksFailuer(this.errorMessage);
}
