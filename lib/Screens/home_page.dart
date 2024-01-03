import 'package:flutter/material.dart';
import 'package:os_project/Screens/home_page_widgets/index_screen.dart';
import '../Screens/home_page_widgets/input_fields.dart';
import 'home_page_widgets/pages_circles.dart';
import 'package:carousel_indicator/carousel_indicator.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  int MainpageIndex = 0;
  final controller = PageController();

  Widget build(BuildContext context) {
    List<Widget> pages = [
      MyIndexScreen(),
      MyIndexScreen(),
    ];

    return Scaffold(
      body: PageView(
          controller: controller,
          physics: const NeverScrollableScrollPhysics(),
          children: pages),
    );
  }
}
