import 'package:flutter/material.dart';

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
      home: GestureDetector(
        onTap: () {
          // Dismiss the keyboard and unfocus the text field
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Signin Page'),
            backgroundColor: const Color.fromARGB(255, 88, 1, 68),
          ),
          body: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Please use the below form to login'),
                const SizedBox(height: 20),
                TextField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'username',
                    border: OutlineInputBorder(
                      gapPadding: 10,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      gapPadding: 10,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                ElevatedButton(onPressed: () {}, child: const Text('Login'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
