import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.username});

  final String username;

  final List<String> imagePaths = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
    'assets/images/5.jpg',
    'assets/images/6.jpg',
    'assets/images/7.jpg',
  ];

  Future<void> _logout() async {
    final sharedPreference = await SharedPreferences.getInstance();
    await sharedPreference.remove('user');
  }

  @override
  Widget build(BuildContext context) {
    String capitalizedUsername =
        username.substring(0, 1).toUpperCase() + username.substring(1);

    final screenHeight = MediaQuery.of(context).size.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final appBarHeight = AppBar().preferredSize.height;

    const textWidgetHeight = 45.0; // Adjust this value as needed
    final sizedBoxHeight =
        screenHeight - statusBarHeight - appBarHeight - textWidgetHeight;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
              onPressed: () {
                _logout();
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: textWidgetHeight,
              child: Center(
                  child: Text(
                'Hi welcome $capitalizedUsername',
                style: const TextStyle(fontSize: 16),
              ))),
          SizedBox(
            height: sizedBoxHeight,
            child: ListView.builder(
              itemCount: imagePaths.length,
              itemBuilder: (ctx, index) {
                if (index % 2 == 0) {
                  return Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          imagePaths[index],
                          width: double.infinity,
                          height: 250,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Image ${index + 1}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      Image.asset(
                        imagePaths[index],
                        width: double.infinity,
                        height: 250,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Image ${index + 1}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
