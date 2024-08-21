import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final IconData icon;
  final bool isPass;
  final bool isPasswordVisible; // Add this line
  final VoidCallback togglePasswordVisibility; // Add this line

  const TextFieldInput({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    required this.icon,
    this.isPass = false,
    this.isPasswordVisible = false, // Add this lined
    required this.togglePasswordVisibility, // Add this line
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: textEditingController,
        obscureText: isPass && !isPasswordVisible, // Modify this line
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(icon),
          suffixIcon: isPass // Add this block
              ? IconButton(
            icon: Icon(
              isPasswordVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
            ),
            onPressed: togglePasswordVisibility,
          )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
