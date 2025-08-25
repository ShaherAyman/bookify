import 'package:bookify/Features/home/presentation/views/widgets/best_seller_List_view.dart';
import 'package:bookify/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookify/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:bookify/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: CustomAppbar(),
              ),

              FuturesbooksListView(),

              SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text('General Books', style: Styles.textStyle18),
              ),

              SizedBox(height: 30),

              //  BestSellerlistView(),
            ],
          ),
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: BestSellerlistView(),
          ),
        ),
      ],
    );
  }
}
