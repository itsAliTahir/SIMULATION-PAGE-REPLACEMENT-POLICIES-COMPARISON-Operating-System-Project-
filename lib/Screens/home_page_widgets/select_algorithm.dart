import 'package:flutter/material.dart';
import 'package:os_project/global_data.dart';

class MySelectAlgorithm extends StatefulWidget {
  const MySelectAlgorithm({super.key});

  @override
  State<MySelectAlgorithm> createState() => _MySelectAlgorithmState();
}

class _MySelectAlgorithmState extends State<MySelectAlgorithm>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 400,
          height: 200,
          color: Colors.blue,
        ),
        Container(
          width: 400,
          height: 120,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  algorithmIndex = 1;
                  MainpageIndex = 1;

                  setState(() {});
                  print(algorithmIndex);
                  controllerMain.animateToPage(1,
                      curve: Curves.linear,
                      duration: const Duration(milliseconds: 500));

                  setState(() {});
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text("FIFO"),
                ),
              ),
              GestureDetector(
                onTap: () {
                  algorithmIndex = 2;
                  MainpageIndex = 1;
                  setState(() {});
                  print(algorithmIndex);
                  controllerMain.animateToPage(2,
                      curve: Curves.linear,
                      duration: const Duration(milliseconds: 500));
                  setState(() {});
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text("LIFO"),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text("LRU"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
