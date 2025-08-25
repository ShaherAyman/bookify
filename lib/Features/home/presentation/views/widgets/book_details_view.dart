import 'package:bookify/Features/home/data/models/book_model/book_model.dart';
import 'package:bookify/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookify/Features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    super.initState();

    final categories = widget.bookModel.volumeInfo.categories;

    if (categories != null && categories.isNotEmpty) {
      BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
        category: categories.first,
      );
    } else {
      debugPrint("⚠️ No category available for this book");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BookDetailsViewBody(
          bookModel: widget.bookModel,
        ),
      ),
    );
  }
}
