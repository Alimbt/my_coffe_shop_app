import 'package:flutter/material.dart';

/// {@template manage_drinks}
/// ManageDrinks widget.
/// {@endtemplate}
class ManageDrinks extends StatelessWidget {
  /// {@macro manage_drinks}
  const ManageDrinks({
    super.key, // ignore: unused_element
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(
        child: Container(),
      ),
    );
  }
}
