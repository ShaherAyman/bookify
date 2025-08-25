import 'package:bookify/Features/home/data/models/book_model/book_model.dart';
import 'package:bookify/Features/home/data/repos/home_repo.dart';
import 'package:bookify/core/errors/failures.dart';
import 'package:bookify/core/utils/api_services.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiServices apiServices;
  HomeRepoImplementation(this.apiServices);

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiServices.get(
        endpoints: 'volumes?Filtering=free-ebooks&Sorting=newest&q=social',
      );

      List<BookModel> books = [];

      for (var item in data['items']) {

        
        books.add(BookModel.fromJson(item));
      
      }

      return right(books);

    }
    
     catch (e) {

     if ( e is DioError)
     {
      return left(ServerFailure.fromDioError(e));
     }

     return Left(ServerFailure(e.toString())) ;


    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async{

    try {
      var data = await apiServices.get(
        endpoints: 'volumes?Filtering=free-ebooks&q=Programing',
      );

      List<BookModel> books = [];

      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }

      return right(books);

    }
    
     catch (e) {

     if ( e is DioError)
     {
      return left(ServerFailure.fromDioError(e));
     }

     return Left(ServerFailure(e.toString())) ;


    }
  }
  
  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category}) async{
   try {
      var data = await apiServices.get(
        endpoints: 'volumes?Sorting=relevance&Filtering=free-ebooks&Sorting=newest&q=$category',
      );

      List<BookModel> books = [];

      for (var item in data['items']) {

        
        books.add(BookModel.fromJson(item));
      
      }

      return right(books);

    }
    
     catch (e) {

     if ( e is DioError)
     {
      return left(ServerFailure.fromDioError(e));
     }

     return Left(ServerFailure(e.toString())) ;

     }
    }
    
      @override
      Future<Either<Failure, List<BookModel>>> fetchSearchedBooks({required String bookName}) async{
        try {
    var data = await apiServices.get(
      endpoints: 'volumes?Filtering=free-ebooks&q=$bookName',
    );

    List<BookModel> books = [];

    for (var item in data['items']) {
      books.add(BookModel.fromJson(item));
    }

    return right(books);
    
  } catch (e) {
    if (e is DioError) {
      return left(ServerFailure.fromDioError(e));
    }
    return left(ServerFailure(e.toString()));
  }
      }
  }
