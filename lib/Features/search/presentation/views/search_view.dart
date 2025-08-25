import 'package:bookify/Features/home/data/repos/home_repo.dart';
import 'package:bookify/Features/home/data/repos/home_repo_implementation.dart';
import 'package:bookify/Features/search/presentation/manager/cubit/search_book_cubit.dart';
import 'package:bookify/Features/search/presentation/views/widgets/search_view_body.dart';
import 'package:bookify/core/utils/api_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SearchBookCubit(HomeRepoImplementation(ApiServices(Dio()))),
        child: SafeArea(child: SearchViewBody()),
      ),
    );
  }
}

