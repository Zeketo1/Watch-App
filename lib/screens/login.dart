import 'package:flutter/material.dart';
import 'package:smart_watch_app/widgets/button.dart';
import 'package:smart_watch_app/widgets/text_field.dart';
import 'package:smart_watch_app/Login/Signup/Services/auth_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool isPasswordVisible = false;

  Future<void> login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      showError('Please fill out all fields.');
      return;
    }

    setState(() {
      isLoading = true;
    });

    final authService = AuthService();

    final response = await authService.loginUser(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    if (response == "success") {
      // Navigate to the home screen after successful login
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      showError(response);
    }

    setState(() {
      isLoading = false;
    });
  }

  void showError(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Login Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void navigateToForgotPassword() {
    Navigator.pushNamed(context, '/forgot-password');
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
        child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          SizedBox(
          width: double.infinity,
          height: height / 2.7,
          child: Image.asset("images/login.jpg"),
        ),
        TextFieldInput(
          textEditingController: emailController,
          hintText: "Email Address",
          icon: Icons.email,
        ),
        TextFieldInput(
          textEditingController: passwordController,
          hintText: "Password",
          icon: Icons.lock,
          isPass: true,
          isPasswordVisible: isPasswordVisible, // Pass visibility state
          togglePasswordVisibility: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          }, // Pass toggle function
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: navigateToForgotPassword,
              child: const Text(
                "Forgot Password?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ),
        isLoading
            ? const CircularProgressIndicator()
            : MyButton(
          onTab: login,
          text: "Log In",
        ),
        SizedBox(height: height / 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const Text(
          "Don't have an account?",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        GestureDetector(
        onTap: () {
      Navigator.pushNamed(context, '/signup');
    },
    child: const Text(
    " Sign Up",
    style: TextStyle(
    fontWeight: Font
