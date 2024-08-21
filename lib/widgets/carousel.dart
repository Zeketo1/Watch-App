import 'package:flutter/material.dart';

class ImageCarousel extends StatelessWidget {
  final String? imagePath;

  const ImageCarousel({super.key, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(imagePath!, fit: BoxFit.cover,);
  }
}
