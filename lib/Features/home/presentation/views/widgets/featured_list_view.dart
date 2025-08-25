import 'package:bookify/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookify/Features/home/presentation/views/widgets/cutom_book_image.dart';
import 'package:bookify/core/widgets/custom_error_widget.dart';
import 'package:bookify/core/widgets/custom_loading_indecator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FuturesbooksListView extends StatelessWidget {
  const FuturesbooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess){
            return SizedBox(
          height: MediaQuery.of(context).size.height * .3,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: state.books.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  onTap: (){
                    GoRouter.of(context).push('/bookDetailsView',extra: state.books[index]);

                  } ,
                  child: CustomBookImage(
                    
                    imageUrl: state.books[index].volumeInfo.imageLinks.thumbnail,
                  
                  ),
                ),
              );
            },
          ),
        );
        } 
        else if (state is FeaturedBooksFailure){
          return CustomErrorWidget(errorMessage: state.errorMessage);
        }
        else 
        {
          return CustomLoadingIndecator();
        }
      },
    );
  }
}
