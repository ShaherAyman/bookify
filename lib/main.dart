import 'package:bookify/Features/home/data/repos/home_repo_implementation.dart';
import 'package:bookify/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookify/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookify/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookify/core/utils/api_services.dart';
import 'package:bookify/core/utils/app_router.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const Bookify());
}

class Bookify extends StatelessWidget {
  const Bookify({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
           
              HomeRepoImplementation(ApiServices(Dio())),
            
          )..fetchFeaturedBooks(), // featured
        ),

        BlocProvider(
          create: (context) =>
              NewestBooksCubit(HomeRepoImplementation(ApiServices(Dio())))
                ..fetchNewestBooks(), // news
        ),

         BlocProvider(
          create: (context) =>
              SimilarBooksCubit(HomeRepoImplementation(ApiServices(Dio()))), // news
        ),


      ],

      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,

        // theme: ThemeData.dark().copyWith(
        //   scaffoldBackgroundColor: Colors.black,

        //   textTheme: GoogleFonts.montserratTextTheme(
        //     ThemeData.dark().textTheme,
        //   ),
        // ),
        
       theme: ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF001F3F), // أزرق غامق قوي
  primaryColor: const Color(0xFF0A84FF),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF0A84FF),   // أزرق فاتح للعناصر
    secondary: Color(0xFF339CFF),
    surface: Color(0xFF0D1B2A),   // الكروت أزرق أفتح من الخلفية
    background: Color(0xFF001F3F),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF0D1B2A),
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),
  textTheme: GoogleFonts.montserratTextTheme(
    ThemeData.dark().textTheme,
  ).apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  ),
),


        // home: SplashView(),
      ),
    );
  }
}
