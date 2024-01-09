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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromARGB(255, 116, 178, 254),
              Color.fromARGB(255, 9, 117, 249),
            ])),
        child: TabBarView(
            controller: tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: pages),
      ),
    );
  }
}
