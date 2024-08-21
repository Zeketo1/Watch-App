import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_app/models/cart_model.dart';
import 'package:smart_watch_app/screens/login.dart';
import 'package:smart_watch_app/screens/sign_up.dart';  // Correctly import SignUpScreen
import 'package:smart_watch_app/screens/home.dart';    // Import HomeScreen
import 'package:smart_watch_app/screens/splash_screen.dart'; // Import the SplashScreen
import 'package:smart_watch_app/screens/forgotPass.dart'; // Import the ForgotPasswordScreen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with error handling
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print('Firebase initialization error: $e');
  }

  runApp(
    ChangeNotifierProvider(
      create: (context) => Cart(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.brown,
      ),
      initialRoute: '/splash',  // Set the initial route to splash screen
      getPages: [
        GetPage(name: '/splash', page: () => SplashScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/signup', page: () => SignUpScreen()),  // Corrected: Ensure this matches the class name
        GetPage(name: '/forgot-password', page: () => ForgotPasswordScreen()),  // Forgot Password route
        GetPage(name: '/home', page: () => HomeScreen()),  // Home Screen route
      ],
    );
  }
}
