import 'package:bookify/Features/home/data/repos/home_repo_implementation.dart';
import 'package:bookify/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookify/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookify/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookify/core/utils/app_router.dart';
import 'package:bookify/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupServiceLocator();
  runApp(const Bookify());
}

class Bookify extends StatefulWidget {
  const Bookify({super.key});

  @override
  State<Bookify> createState() => _BookifyState();
}

class _BookifyState extends State<Bookify> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(getIt.get<HomeRepoImplementation>())
                ..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(getIt.get<HomeRepoImplementation>())
                ..fetchNewestBooks(),
        ),
        BlocProvider(
          create: (context) =>
              SimilarBooksCubit(getIt.get<HomeRepoImplementation>()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: isDarkMode
            ? ThemeData.dark().copyWith(
                scaffoldBackgroundColor: const Color(0xFF1A0A00),
                appBarTheme: const AppBarTheme(
                  backgroundColor: Color(0xFF1A0A00),
                  elevation: 0,
                  iconTheme: IconThemeData(color: Colors.white),
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : ThemeData(
                scaffoldBackgroundColor: const Color(0xFFF5EEDD),
                colorScheme: ColorScheme.fromSeed(
                  seedColor: const Color(0xFFF5EEDD),
                  primary: Colors.brown, // لون أساسي أوضح
                ),
                appBarTheme: const AppBarTheme(
                  backgroundColor: Color(0xFFF5EEDD),
                  elevation: 0,
                  iconTheme: IconThemeData(color: Colors.black),
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                progressIndicatorTheme: const ProgressIndicatorThemeData(
                  color: Colors.brown, // عشان اللودينج يبان كويس
                ),
                inputDecorationTheme: InputDecorationTheme(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.brown, width: 1.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.brown, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
              ),
        builder: (context, child) {
          return Scaffold(
            drawer: Drawer(
              child: ListView(
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.brown,
                    ),
                    child: Text(
                      "Settings",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  SwitchListTile(
                    title: const Text("Dark Mode "),
                    value: isDarkMode,
                    onChanged: (value) {
                      setState(() {
                        isDarkMode = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            body: child,
          );
        },
      ),
    );
  }
}
