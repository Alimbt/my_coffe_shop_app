import 'package:coffee_shop/admin_pages/dashboard.dart';

import 'package:coffee_shop/classes/frosted_glass.dart';
import 'package:coffee_shop/user_pages/drink_page.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 77, 71, 71),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 31, 19, 15),
          title: const Text(
            'login page',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/coffeeBg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: FrostedGlassBox(
            thewidth: 350.0,
            theheight: 200.0,
            thechild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Welcome to our coffee shop',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 31, 19, 15),
                    foregroundColor: Colors.white,
                    fixedSize: const Size(200, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                        useSafeArea: true,
                        routeSettings: const RouteSettings(name: 'login'),
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Login'),
                            content: const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'phone number',
                                    hintText: 'Enter your phone number pls',
                                  ),
                                ),
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DrinkPage()),
                                  );
                                },
                                child: const Text('Login'),
                              ),
                            ],
                          );
                        });
                  },
                  child: const Text('Login'),
                ),
                const SizedBox(
                  height: 18,
                ),
                RichText(
                  text: TextSpan(
                    text: 'if u are our employee press ',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'here',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 10,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            showDialog(
                                useSafeArea: true,
                                routeSettings:
                                    const RouteSettings(name: 'admin'),
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('admin Login'),
                                    content: const Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        TextField(
                                          decoration: InputDecoration(
                                            labelText: 'password',
                                            hintText:
                                                'Enter your unique pass pls',
                                          ),
                                        ),
                                      ],
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const AdminDashboard()),
                                          );
                                        },
                                        child: const Text('Login'),
                                      ),
                                    ],
                                  );
                                });
                          },
                      ),
                      const TextSpan(
                        text: ' :)',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
