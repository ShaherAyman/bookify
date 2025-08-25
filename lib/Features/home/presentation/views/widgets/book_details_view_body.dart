import 'package:bookify/Features/home/data/models/book_model/book_model.dart';
import 'package:bookify/Features/home/data/repos/home_repo_implementation.dart';
import 'package:bookify/Features/home/presentation/views/widgets/book_details_section.dart';
import 'package:bookify/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookify/Features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:bookify/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookify/core/utils/api_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const CustombookDetailsAppbar(),

                BookDetailsSection(
                  bookModel: bookModel,
                ),

                const SizedBox(height: 15),

                SimilarbooksSection(),
                
              ],
            ),
          ),
        ),
      ],
    );
  }
}
