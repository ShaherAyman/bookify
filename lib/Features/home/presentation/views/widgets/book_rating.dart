import 'package:bookify/Features/home/data/models/book_model/book_model.dart';
import 'package:bookify/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.center,
    required this.bookModel,
  });

  final BookModel bookModel;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final averageRating = bookModel.volumeInfo.averageRating ?? 0;
    final ratingsCount = bookModel.volumeInfo.ratingsCount ?? 0;

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(FontAwesomeIcons.solidStar, color: Colors.amber),
        const SizedBox(width: 3.6),

        Text(
          averageRating.toString(),
          style: Styles.textStyle14,
        ),

        const SizedBox(width: 5),

        Text(
          '($ratingsCount)',
          style: Styles.textStyle14,
        ),
      ],
    );
  }
}
