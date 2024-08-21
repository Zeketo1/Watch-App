import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final String? imagePath;

  const Product({super.key, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(imagePath!, fit: BoxFit.cover,);
  }
}
