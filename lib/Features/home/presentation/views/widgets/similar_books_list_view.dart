import 'package:bookify/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookify/Features/home/presentation/views/widgets/book_details_view.dart';
import 'package:bookify/Features/home/presentation/views/widgets/cutom_book_image.dart';
import 'package:bookify/core/widgets/custom_error_widget.dart';
import 'package:bookify/core/widgets/custom_loading_indecator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SimilarBooksListview extends StatelessWidget {
  const SimilarBooksListview({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(

      builder: (context, state) {

        if (state is SimilarBooksSuccess){
           return SizedBox(

          height: MediaQuery.of(context).size.height * .15,
          child: ListView.builder(
            itemCount: state.books.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
               final book = state.books[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: CustomBookImage(
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BookDetailsView(bookModel: book)));
                  } ,
                  imageUrl: state.books[index].volumeInfo.imageLinks.thumbnail?? '',)
                //
              );
            },
          ),
        );
        }

        else if (state is SimilarBooksFailuer){

          return CustomErrorWidget(errorMessage: state.errorMessage);
        }
        else {
          return CustomLoadingIndecator();
        }

       
      },
    );
  }
}
