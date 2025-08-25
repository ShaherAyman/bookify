import 'package:bookify/Features/home/data/models/book_model/book_model.dart';
import 'package:bookify/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookify/Features/home/presentation/views/widgets/cutom_book_image.dart';
import 'package:bookify/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    final volumeInfo = bookModel.volumeInfo;

    final imageUrl = volumeInfo.imageLinks?.thumbnail ??
        "https://via.placeholder.com/150"; // رابط افتراضي لو مفيش صورة
    final title = volumeInfo.title ?? "No Title";
    final author = (volumeInfo.authors != null && volumeInfo.authors!.isNotEmpty)
        ? volumeInfo.authors![0]
        : "Unknown Author";

    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push('/bookDetailsView', extra: bookModel);
      },
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            CustomBookImage(imageUrl: imageUrl),

            const SizedBox(width: 30),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Styles.textStyle20,
                    ),
                  ),

                  const SizedBox(height: 3),

                  FittedBox(
                    child: Text(
                      author,
                      style: Styles.textStyle14,
                    ),
                  ),

                  const SizedBox(height: 3),

                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Free',
                          style: Styles.textStyle20.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        
                         BookRating(
                          bookModel: bookModel,
                          mainAxisAlignment: MainAxisAlignment.center),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
