import 'package:flutter/material.dart';
import 'package:simple_login_page/screens/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    initialScreen();
    super.initState();
  }

  Future<void> initialScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((ctx) => LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
