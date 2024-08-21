import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_watch_app/screens/home.dart';
import 'package:smart_watch_app/widgets/button_widget.dart'; // Updated import

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Center the content horizontally
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: 200.0,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                "assets/images/products-sp-m (1).jpg",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 40.0),
            const Text(
              "TOP BRANDS WATCH \n FOR THE REAL GENTLEMEN",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40.0),
            ButtonWidget(
              text: "Get Started",
              onTap: () {
                Get.to(
                      () => const HomeScreen(),
                  transition: Transition.fade,
                  duration: const Duration(seconds: 1),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
