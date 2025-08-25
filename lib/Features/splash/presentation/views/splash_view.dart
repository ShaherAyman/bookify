import 'package:bookify/Features/splash/presentation/views/widgets/splash_View_Body.dart';
import 'package:bookify/constant.dart' show kprimarycolor;
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimarycolor, 
      body: SplashViewBody(),
      );
  }
}
