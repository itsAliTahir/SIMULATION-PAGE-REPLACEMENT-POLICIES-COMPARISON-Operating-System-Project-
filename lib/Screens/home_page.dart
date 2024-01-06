import 'package:flutter/material.dart';
import 'package:os_project/Screens/algorithms/lrualgorithm.dart';
import 'algorithms/lifoalgorithm.dart';
import '/Screens/home_page_widgets/index_screen.dart';

import '../global_data.dart';
import 'algorithms/fifoalgorithm.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  List<Widget> pages = [
    const MyIndexScreen(),
    const MyFIFOAlgorithm(),
    const MyLIFOAlgorithm(),
    const MyLRUAlgorithm(),
  ];
  @override
  void initState() {
    super.initState();

    tabController = TabController(
        length: 4,
        vsync: this,
        animationDuration: const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
          controller: tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: pages),
    );
  }
}
