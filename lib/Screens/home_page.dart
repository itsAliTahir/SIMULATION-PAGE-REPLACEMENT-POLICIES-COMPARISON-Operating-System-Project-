import 'package:flutter/material.dart';
import '../Screens/home_page_widgets/input_fields.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text('SIMULATION: PAGE REPLACEMENT POLICIES COMPARISON')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyInputFields(),
          ],
        ),
      ),
    );
  }
}
