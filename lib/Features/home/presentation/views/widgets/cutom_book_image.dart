import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl, this.onTap});

  final String imageUrl;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: onTap ,
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(16),
        child: AspectRatio(
          aspectRatio: 2.6 / 4, //    width/hiegh
          child: CachedNetworkImage(
      
            fit: BoxFit.fill ,
            imageUrl: imageUrl,
            errorWidget: (context ,url, error) => Icon(Icons.wrong_location_sharp),
      
            ),
        ),
      ),
    );
  }
}
