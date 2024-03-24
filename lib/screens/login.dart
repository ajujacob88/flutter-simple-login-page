import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_login_page/models/user.dart';
import 'package:simple_login_page/screens/home.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void isValidUser(
    String enteredUsername,
    String enteredPassword,
    BuildContext context,
  ) {
    bool isUserValid = false;

    if (enteredUsername.isEmpty || enteredPassword.isEmpty) {
      // Show an error message for empty fields
      showErrorMessage(context, 'Username or password cannot be empty.');
      return;
    }

    for (User user in users) {
      if (user.username == enteredUsername &&
          user.password == enteredPassword) {
        isUserValid = true;
        break;
      }
    }

    if (isUserValid) {
      _storeUserCredentials(enteredUsername);
      Navigator.of(context)
          .push(
            MaterialPageRoute(
                builder: (ctx) => HomeScreen(
                      username: enteredUsername,
                    )),
          )
          .then(
            (value) => {
              usernameController.clear(),
              passwordController.clear(),
            },
          );
    } else {
      showErrorMessage(
        context,
        'Invalid username or password. Please try again.',
      );

      // usernameController.clear();
      passwordController.clear();
    }
  }

  Future<void> _storeUserCredentials(String enteredUsername) async {
    final sharedPreference = await SharedPreferences.getInstance();
    await sharedPreference.setString('user', enteredUsername);

    //print(sharedPreference.getString('user'));
  }

  void showErrorMessage(BuildContext context, String dialog) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Error'),
          // content:   const Text('Invalid username or password. Please try again.'),
          actions: [
            Text(dialog),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Ok'))
          ],
        );
      },
    );
  }

  Future<void> _isAlreadyLoggedIn(BuildContext context) async {
    final sharedPreference = await SharedPreferences.getInstance();
    final storedUsername = sharedPreference.getString('user');

    if (storedUsername != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (ctx) => HomeScreen(
                  username: storedUsername,
                )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _isAlreadyLoggedIn(context);
    return GestureDetector(
      onTap: () {
        // Dismiss the keyboard and unfocus the text field
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login Page'),
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
                controller: usernameController,
                //  onChanged: (value) => userName = value,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'username',
                  border: OutlineInputBorder(
                    gapPadding: 10,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: passwordController,
                // onChanged: (value) => passWord = value,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) {
                  // Call the login function when "Done" is pressed
                  isValidUser(usernameController.text, passwordController.text,
                      context);
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    gapPadding: 10,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    isValidUser(usernameController.text,
                        passwordController.text, context);
                  },
                  child: const Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
