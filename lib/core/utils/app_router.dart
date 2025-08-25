import 'package:bookify/Features/home/data/models/book_model/book_model.dart';
import 'package:bookify/Features/home/data/repos/home_repo_implementation.dart';
import 'package:bookify/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookify/Features/home/presentation/views/home_view.dart';
import 'package:bookify/Features/home/presentation/views/widgets/book_details_view.dart';
import 'package:bookify/Features/search/presentation/views/search_view.dart';
import 'package:bookify/Features/splash/presentation/views/splash_view.dart';
import 'package:bookify/core/utils/api_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),

      GoRoute(
        path: '/homeView',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),

      GoRoute(
        path: '/bookDetailsView',
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => SimilarBooksCubit(HomeRepoImplementation(ApiServices(Dio()))),
            child:  BookDetailsView(
              bookModel: state.extra as BookModel,
            ),
          );
        },
      ),

      GoRoute(
        path: '/searchView',
        builder: (BuildContext context, GoRouterState state) {
          return const SearchView();
        },
      ),
    ],
  );
}
