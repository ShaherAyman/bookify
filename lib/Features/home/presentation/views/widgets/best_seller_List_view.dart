import 'package:bookify/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookify/Features/home/presentation/views/widgets/best_seller_view_items.dart';
import 'package:bookify/core/widgets/custom_error_widget.dart';
import 'package:bookify/core/widgets/custom_loading_indecator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerlistView extends StatelessWidget {
  const BestSellerlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess){
          return ListView.builder(
            
          shrinkWrap: true, // take the hight of your children
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: state.books.length,
          itemBuilder: (context, index) {
            
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: BookListViewItem(
                bookModel: state.books[index],
              ),
            );
          },
        );

        }
        else if (state is NewestBooksFailure){
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
