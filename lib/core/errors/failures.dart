import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioError dioError) {

    switch (dioError.type) {

      case DioExceptionType.connectionTimeout:
        return ServerFailure('connectionTimeout with ApiServer ');

      case DioExceptionType.sendTimeout:
        return ServerFailure('sendTimeout with ApoServer ');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('receiveTimeout with ApoServer ');

      case DioExceptionType.badCertificate:
        return ServerFailure('badCertificate with ApoServer ');

      case DioExceptionType.badResponse:
       ServerFailure.frombadResponse( dioError.response!.statusCode! , dioError.response!.data);
      
      case DioExceptionType.cancel:
        return ServerFailure('connectionTimeout with ApiServer wascanceled ');


      case DioExceptionType.connectionError:
      return ServerFailure('connectionTimeout with ApiServer wascanceled ');
      
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException'))
       {
        return ServerFailure('No Internet Connection ');
       }
    }
     return ServerFailure('Opps, there was an error , please try again ');
  }





  factory ServerFailure.frombadResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      ServerFailure('Your request not found, please try again later ');
    } else if (statusCode == 500) {
      ServerFailure('Intenal server Error , pleasetry later  ');
    }

    return ServerFailure('Opps , there was an error , please try again  ');
  }
}
