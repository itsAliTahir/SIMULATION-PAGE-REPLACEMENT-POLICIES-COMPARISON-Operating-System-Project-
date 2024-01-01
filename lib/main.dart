import 'package:flutter/material.dart';

import 'Screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Operating System Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        hoverColor: Colors.blueAccent,
      ),
      home: MyHomePage(),
    );
  }
}
