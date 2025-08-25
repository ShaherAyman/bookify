import 'package:bookify/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
      child: Row(
        children: [
          Image.asset(AssetsData.logo, scale: 8),

          Spacer(),

          IconButton(
            onPressed: () {
              GoRouter.of(context).push('/searchView');
            },
            icon: Icon(FontAwesomeIcons.magnifyingGlass, size: 23),
          ),
        ],
      ),
    );
  }
}
