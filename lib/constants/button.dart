import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isLoading;
  final Color color;
  final TextStyle textStyle;
  final double borderRadius;

  const ButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
    this.isLoading = false,
    this.color = Colors.blue, // Default color
    this.textStyle = const TextStyle(color: Colors.white), // Default text style
    this.borderRadius = 10.0, required Future<void> Function() onPressed, // Default border radius
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap, // Disable onTap when loading
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: isLoading ? Colors.grey : color, // Show grey color when loading
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
            color: Colors.white, // Loading indicator color
          )
              : Text(
            text,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
