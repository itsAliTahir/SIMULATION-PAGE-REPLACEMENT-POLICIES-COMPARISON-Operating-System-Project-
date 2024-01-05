import 'package:flutter/material.dart';
import 'package:os_project/Screens/algorithms/lrualgorithm.dart';
import 'algorithms/lifoalgorithm.dart';
import '/Screens/home_page_widgets/index_screen.dart';

import '../global_data.dart';
import 'algorithms/fifoalgorithm.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      MyIndexScreen(),
      MyFIFOAlgorithm(),
      MyLIFOAlgorithm(),
      MyLRUAlgorithm(),
    ];

    return Scaffold(
      body: PageView(
          controller: controllerMain,
          physics: const NeverScrollableScrollPhysics(),
          children: pages),
    );
  }
}
