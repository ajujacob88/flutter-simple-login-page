import 'package:flutter/material.dart';
//import 'package:simple_login_page/screens/login.dart';
import 'package:simple_login_page/screens/splash.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Colors.black,
  ),
  fontFamily: 'Roboto',
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const SplashScreen(),
    );
  }
}
