import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:os_project/Screens/home_page_widgets/input_fields.dart';
import 'package:os_project/Screens/home_page_widgets/pages_circles.dart';

import '../../global_data.dart';
import 'select_algorithm.dart';

class MyIndexScreen extends StatefulWidget {
  const MyIndexScreen({super.key});

  @override
  State<MyIndexScreen> createState() => _MyIndexScreenState();
}

class _MyIndexScreenState extends State<MyIndexScreen> {
  @override
  Widget build(BuildContext context) {
    List<Widget> slides = [
      MyInputFields(),
      MyPagesCircles(),
      MySelectAlgorithm(),
    ];
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 400,
              height: 60,
              color: Colors.transparent,
              child: const Text(
                'SIMULATION: PAGE REPLACEMENT POLICIES COMPARISON',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Container(
              width: 400,
              height: 320,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: slideController,
                children: slides,
                onPageChanged: (index) {
                  setState(() {
                    pageIndex = index;
                  });
                },
              ),
            ),
            Container(
              width: 400,
              height: 80,
              decoration: const BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0))),
              child: Card(
                color: Colors.white,
                surfaceTintColor: Colors.white,
                elevation: 5,
                margin: const EdgeInsets.all(0),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0))),
                child: Row(
                  mainAxisAlignment: pageIndex == 1
                      ? MainAxisAlignment.spaceEvenly
                      : MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    pageIndex > 0
                        ? InkWell(
                            onTap: () {
                              if (pageIndex > 0) {
                                setState(() {
                                  pageIndex--;
                                  slideController.animateToPage(pageIndex,
                                      duration: Duration(milliseconds: 500),
                                      curve: Easing.standard);
                                });
                              }
                            },
                            borderRadius: BorderRadius.circular(10),
                            child: Ink(
                              width: 120,
                              height: 60,
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  "Back",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
                    pageIndex < 2
                        ? InkWell(
                            onTap: () {
                              if (pageIndex < 2) {
                                setState(() {
                                  pageIndex++;
                                  slideController.animateToPage(pageIndex,
                                      duration: Duration(milliseconds: 500),
                                      curve: Easing.standard);
                                });
                              }
                            },
                            borderRadius: BorderRadius.circular(10),
                            child: Ink(
                              width: 120,
                              height: 60,
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
            CarouselIndicator(
              count: slides.length,
              index: pageIndex,
            ),
          ],
        ),
      ),
    );
  }
}
