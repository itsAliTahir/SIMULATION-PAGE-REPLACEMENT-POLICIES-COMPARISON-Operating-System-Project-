import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:os_project/Screens/home_page_widgets/input_fields.dart';
import 'package:os_project/Screens/home_page_widgets/pages_circles.dart';
import 'package:provider/provider.dart';
import '../../Provider/data_provider.dart';
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
    final changeNextStatus =
        Provider.of<ProviderClass>(context).changeNextStatus;
    final pagesIds = Provider.of<ProviderClass>(context).pagesIds;
    List<Widget> slides = [
      const MyInputFields(),
      const MyPagesCircles(),
      const MySelectAlgorithm(),
    ];
    return Center(
      child: SingleChildScrollView(
        child: Container(
          width: 400,
          height: 470,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: Container(
                  width: 400,
                  height: 60,
                  color: Colors.transparent,
                  child: const Text(
                    'SIMULATION: PAGE REPLACEMENT POLICIES COMPARISON',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "WorkSans",
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
              Positioned(
                top: 60,
                child: Container(
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
              ),
              Positioned(
                top: 379,
                child: Container(
                  width: 400,
                  height: 80,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0))),
                  child: Card(
                    semanticContainer: false,
                    borderOnForeground: false,
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    color: Colors.white,
                    surfaceTintColor: Colors.white,
                    margin: const EdgeInsets.all(0.0),
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
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Easing.standard);
                                    });
                                  }
                                },
                                borderRadius: BorderRadius.circular(10),
                                child: Ink(
                                  width: 120,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
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
                                  if (pageIndex == 1) {
                                    for (int i = 0;
                                        i < int.parse(pageController.text);
                                        i++) {
                                      if (pagesIds[i] == -1) {
                                        changeNextStatus(true);
                                        return;
                                      }
                                    }
                                  }
                                  changeNextStatus(false);
                                  if (pageIndex < 2) {
                                    setState(() {
                                      pageIndex++;
                                      slideController.animateToPage(pageIndex,
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Easing.standard);
                                    });
                                  }
                                },
                                borderRadius: BorderRadius.circular(10),
                                child: Ink(
                                  width: 120,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
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
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CarouselIndicator(
                  count: slides.length,
                  index: pageIndex,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
