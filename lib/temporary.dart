import 'package:flutter/material.dart';

class MyTemporary extends StatelessWidget {
  const MyTemporary({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "The owner has disabled access to this website.   :(",
          style: TextStyle(
              color: Colors.grey, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
