import 'package:bookify/Features/home/presentation/views/widgets/best_seller_view_items.dart';
import 'package:bookify/Features/search/presentation/manager/cubit/search_book_cubit.dart';
import 'package:bookify/Features/search/presentation/views/widgets/custom_search_text_view.dart';
import 'package:bookify/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15),
          CustomSearchTextField(),
          SizedBox(height: 15),
          Text('Search Result', style: Styles.textStyle18),
          SizedBox(height: 10),
          Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBookCubit, SearchBookState>(
      builder: (context, state) {
        if (state is SearchBookLoading) {
          return const Center(child: CircularProgressIndicator());

        } 
        else if (state is SearchBookSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: BookListViewItem(bookModel: state.books[index]),
              );
            },
          );
        } else if (state is SearchBookFailure) {
          return Center(child: Text('book is not available'));
        } else {
          return const Center(
            child: Text(" Search for a book 👆"),
          );
        }
      },
    );
  }
}


