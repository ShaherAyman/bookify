import 'package:bookify/Features/home/data/repos/home_repo_implementation.dart';
import 'package:bookify/core/utils/api_services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

void setup() {
  getit.registerSingleton<HomeRepoImplementation>(
    HomeRepoImplementation(ApiServices(Dio())),
  );

  
} 