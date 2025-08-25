import 'package:bookify/Features/home/data/models/book_model/book_model.dart';
import 'package:bookify/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookify/Features/home/presentation/views/widgets/book_action.dart';
import 'package:bookify/Features/home/presentation/views/widgets/cutom_book_image.dart';
import 'package:bookify/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        // صورة الكتاب أو صورة بديلة
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .17),
          child: CustomBookImage(
            imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ??
                "https://via.placeholder.com/150", // fallback
          ),
        ),

        const SizedBox(height: 24),

        // عنوان الكتاب أو نص بديل
        Text(
          bookModel.volumeInfo.title ?? "No Title Available",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),

        const SizedBox(height: 8),

        // المؤلف أو نص بديل
        Opacity(
          opacity: 0.7,
          child: FittedBox(
            child: Text(
              (bookModel.volumeInfo.authors != null &&
                      bookModel.volumeInfo.authors!.isNotEmpty)
                  ? bookModel.volumeInfo.authors!.first
                  : "Unknown Author",
              style: Styles.textStyle14,
            ),
          ),
        ),

        const SizedBox(height: 18),

        // تقييم الكتاب
         BookRating(
          bookModel: bookModel,
          mainAxisAlignment: MainAxisAlignment.center),

        const SizedBox(height: 35),

        // زرار الاكشن
        BookAction(bookModel: bookModel),
      ],
    );
  }
}
