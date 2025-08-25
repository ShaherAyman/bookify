import 'package:bookify/Features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:bookify/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SimilarbooksSection extends StatelessWidget {
  const SimilarbooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also review ',
          style: Styles.textStyle18.copyWith(fontWeight: FontWeight.w600),
        ),

        SizedBox(height: 16),

       SimilarBooksListview(),

        SizedBox(height: 10),
      ],
    );
  }
}
