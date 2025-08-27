import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl, this.onTap});

  final String imageUrl;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //2.6 / 4,
      onTap: onTap,
      child: Material(
        elevation: 10, // قوة الظل (جرب 4 - 6 - 8)
        borderRadius: BorderRadius.circular(16),
        shadowColor: Colors.black.withOpacity(0.3), // لون الظل
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
            aspectRatio:  1.3 / 1.9, // width/height
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: imageUrl,
              errorWidget: (context, url, error) =>
                  const Icon(Icons.wrong_location_sharp),
            ),
          ),
        ),
      ),
    );
  }
}
