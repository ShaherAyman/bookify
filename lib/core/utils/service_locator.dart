import 'package:bookify/Features/home/data/repos/home_repo_implementation.dart';
import 'package:bookify/core/utils/api_services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<HomeRepoImplementation>(
    HomeRepoImplementation(
      ApiServices(
        Dio(),
        ),
      ),
  );
}
