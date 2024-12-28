import 'package:coffee_shop/user_pages/drink_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// {@template home_page}
/// LoginPage widget.
/// {@endtemplate}
class LoginPage extends StatelessWidget {
  /// {@macro home_page}
  const LoginPage({
    super.key, // ignore: unused_element
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 77, 71, 71),
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: const Text(
            'login page',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Welcome to the coffee shop',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DrinkPage()),
                  );
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
