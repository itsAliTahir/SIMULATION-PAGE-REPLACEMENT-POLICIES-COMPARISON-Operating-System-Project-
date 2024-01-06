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
      required bool hover,
      required String image}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: algorithmindex == 1 && h1 == true ||
              algorithmindex == 2 && h2 == true ||
              algorithmindex == 3 && h3 == true
          ? 110
          : 90,
      height: algorithmindex == 1 && h1 == true ||
              algorithmindex == 2 && h2 == true ||
              algorithmindex == 3 && h3 == true
          ? 90
          : 80,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: algorithmindex == 1 && h1 == true ||
                    algorithmindex == 2 && h2 == true ||
                    algorithmindex == 3 && h3 == true
                ? 1.5
                : 1,
            color: algorithmindex == 1 && h1 == true ||
                    algorithmindex == 2 && h2 == true ||
                    algorithmindex == 3 && h3 == true
                ? Theme.of(context).scaffoldBackgroundColor
                : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
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
            print(":$algorithmIndex");
            setState(() {});
            tabController.animateTo(algorithmIndex);

            setState(() {});
          },
          child: HoverWidget(
            onHover: (event) {},
            hoverChild: Container(
              child: Center(
                child: Container(
                  width: algorithmindex == 1
                      ? 80
                      : algorithmindex == 2
                          ? 70
                          : 60,
                  height: algorithmindex == 1
                      ? 80
                      : algorithmindex == 2
                          ? 70
                          : 60,
                  child: Image.asset(
                    image,
                  ),
                ),
              ),
            ),
            child: Container(
              child: Center(
                child: Container(
                    margin: const EdgeInsets.all(5),
                    child: Text(
                      title,
                      style: TextStyle(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          fontSize: 14),
                    )),
              ),
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
                            "FIRST IN FIRST OUT",
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
                                "LAST IN FIRST OUT",
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
                                    "LEAST RECENTLY USED",
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
                                fontSize: 14,
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
                                    fontSize: 14,
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
                                        fontSize: 14,
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
              makeButton(
                  algorithmindex: 1,
                  title: "FIFO",
                  hover: h1,
                  image: "fifo.png"),
              makeButton(
                  algorithmindex: 2,
                  title: "LIFO",
                  hover: h2,
                  image: "lifo.png"),
              makeButton(
                  algorithmindex: 3, title: "LRU", hover: h3, image: "lru.png"),
            ],
          ),
        ),
      ],
    );
  }
}
