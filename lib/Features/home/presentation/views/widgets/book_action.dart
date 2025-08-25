import 'package:bookify/Features/home/data/models/book_model/book_model.dart';
import 'package:bookify/core/utils/functions/lunch_url.dart';
import 'package:bookify/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';


class BookAction extends StatelessWidget {
  const BookAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: 'Free',
            backgroundColor: Colors.white,
            textColor: Colors.black,
            borderRaduis: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
        ),

        Expanded(
          child: CustomButton(
            onPressed: () async {

              launchCustomUr(context, bookModel.volumeInfo.previewLink);

            },
            text: getText(bookModel),
            backgroundColor: Colors.deepOrangeAccent,
            textColor: Colors.white,
            borderRaduis: BorderRadius.only(
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
        ),
      ],
    );
  }

  String getText(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return "Not Available ";
    } else {
      return 'Preview';
    }
  }
}
