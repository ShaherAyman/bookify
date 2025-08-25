import 'package:bookify/Features/home/data/models/book_model/book_model.dart';
import 'package:bookify/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo 
{
  // repository pattern

Future < Either< Failure , List<BookModel>> > fetchNewestBooks(); 
Future < Either< Failure , List<BookModel>> > fetchFeaturedBooks();

Future < Either< Failure , List<BookModel>> > fetchSimilarBooks({required String category});

Future <Either <Failure , List<BookModel>> > fetchSearchedBooks ({required String bookName});





}