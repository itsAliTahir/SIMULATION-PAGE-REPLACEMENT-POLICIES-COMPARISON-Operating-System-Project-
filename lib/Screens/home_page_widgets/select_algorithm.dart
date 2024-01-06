import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:os_project/global_data.dart';
import "package:hovering/hovering.dart";

class MySelectAlgorithm extends StatefulWidget {
  const MySelectAlgorithm({super.key});

  @override
  State<MySelectAlgorithm> createState() => _MySelectAlgorithmState();
}

class _MySelectAlgorithmState extends State<MySelectAlgorithm>
    with TickerProviderStateMixin {
  Widget makeButton(
      {required int algorithmindex,
      required String title,
      required bool hover}) {
    return MouseRegion(
      onEnter: (event) {
        if (algorithmindex == 1) {
          h1 = true;
        } else if (algorithmindex == 2) {
          h2 = true;
        } else if (algorithmindex == 3) {
          h3 = true;
        } else {
          h1 = false;
          h2 = false;
          h3 = false;
        }
        setState(() {});
      },
      onExit: (event) {
        h1 = false;
        h2 = false;
        h3 = false;
        setState(() {});
      },
      child: GestureDetector(
        onTap: () {
          algorithmIndex = algorithmindex;
          MainpageIndex = 1;

          setState(() {});
          print(algorithmIndex);
          controllerMain.animateToPage(algorithmindex,
              curve: Curves.linear,
              duration: const Duration(milliseconds: 500));

          setState(() {});
        },
        child: HoverWidget(
          onHover: (event) {},
          hoverChild: Container(
            width: 110,
            height: 90,
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border.all(
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                borderRadius: BorderRadius.circular(10)),
            child: Stack(
              children: [
                Container(
                    margin: const EdgeInsets.all(5),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          title,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                              fontSize: 16),
                        ))),
              ],
            ),
          ),
          child: Container(
            width: 110,
            height: 90,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: Stack(
              children: [
                Container(
                    margin: const EdgeInsets.all(5),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          title,
                          style: TextStyle(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                              fontSize: 12),
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool h1 = false;
  bool h2 = false;
  bool h3 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 400,
          height: 200,
          // color: Colors.blue,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  h1 == true
                      ? DelayedDisplay(
                          fadingDuration: const Duration(milliseconds: 500),
                          child: Text(
                            "FIRST IN FIRST OUT Page Replacement Algorithm",
                            style: TextStyle(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ))
                      : h2 == true
                          ? DelayedDisplay(
                              fadingDuration: const Duration(milliseconds: 500),
                              child: Text(
                                "LAST IN FIRST OUT Page Replacement Algorithm",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ))
                          : h3 == true
                              ? DelayedDisplay(
                                  fadingDuration:
                                      const Duration(milliseconds: 500),
                                  child: Text(
                                    "LEAST RECENTLY USED Page Replacement Algorithm",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ))
                              : const SizedBox(),
                  h1 == true
                      ? const DelayedDisplay(
                          delay: Duration(milliseconds: 300),
                          fadingDuration: Duration(milliseconds: 600),
                          child: Text(
                            "This algorithm follows the principle of 'first in, first out,' treating memory pages like a queue where the page that has been in memory the longest is the first to be replaced. ",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ))
                      : h2 == true
                          ? const DelayedDisplay(
                              delay: Duration(milliseconds: 300),
                              fadingDuration: Duration(milliseconds: 600),
                              child: Text(
                                "Last In First Out treats memory pages as a stack, where the page that has been most recently added to memory is the first one to be considered for replacement.",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ))
                          : h3 == true
                              ? const DelayedDisplay(
                                  delay: Duration(milliseconds: 300),
                                  fadingDuration: Duration(milliseconds: 600),
                                  child: Text(
                                    "This algorithm aims to capture the temporal locality of page accesses by prioritizing pages that have been recently used. This enhances adaptability to process access patterns, potentially minimizing page faults.",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ))
                              : const SizedBox(),
                  h1 == false && h2 == false && h3 == false
                      ? const DelayedDisplay(
                          delay: Duration(milliseconds: 300),
                          fadingDuration: Duration(milliseconds: 600),
                          child: Text(
                            "Select A Page Replacement Algorithm",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ))
                      : const SizedBox()
                ]),
          ),
        ),
        Container(
          width: 400,
          height: 120,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              makeButton(algorithmindex: 1, title: "FIFO", hover: h1),
              makeButton(algorithmindex: 2, title: "LIFO", hover: h2),
              makeButton(algorithmindex: 3, title: "LRU", hover: h3),
            ],
          ),
        ),
      ],
    );
  }
}
