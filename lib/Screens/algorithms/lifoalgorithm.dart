// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'slides_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Provider/data_provider.dart';
import '../../global_data.dart';

class MyLIFOAlgorithm extends StatefulWidget {
  const MyLIFOAlgorithm({super.key});

  @override
  State<MyLIFOAlgorithm> createState() => _MyLIFOAlgorithmState();
}

class _MyLIFOAlgorithmState extends State<MyLIFOAlgorithm> {
  List<int> stackValues = List<int>.filled(7, -2);
  List<String> stringResult = List<String>.filled(20, "-");
  bool isHit = false;
  bool isStarted = false;
  int hitIndex = -1;
  String bottomText = "";
  Color bottomTextColor = Colors.transparent;

  Widget Frame0 = Container(
    height: 60,
    width: 100,
    margin: const EdgeInsets.only(top: 0 * 60),
  );
  Widget Frame1 = Container(
    height: 60,
    width: 100,
    margin: const EdgeInsets.only(top: 1 * 60),
  );
  Widget Frame2 = Container(
    height: 60,
    width: 100,
    margin: const EdgeInsets.only(top: 2 * 60),
  );
  Widget Frame3 = Container(
    height: 60,
    width: 100,
    margin: const EdgeInsets.only(top: 3 * 60),
  );
  Widget Frame4 = Container(
    height: 60,
    width: 100,
    margin: const EdgeInsets.only(top: 4 * 60),
  );
  Widget Frame5 = Container(
    height: 60,
    width: 100,
    margin: const EdgeInsets.only(top: 5 * 60),
  );
  Widget Frame6 = Container(
    height: 60,
    width: 100,
    margin: const EdgeInsets.only(top: 6 * 60),
  );
  Widget HitFrame = Container(
    height: 60,
    width: 100,
    margin: const EdgeInsets.only(top: 6 * 60),
  );
  int lastInIndex = -1;
  Timer mytimer = Timer.periodic(Duration.zero, (timer) {});
  Timer mytimer1 = Timer.periodic(Duration.zero, (timer) {});
  int referenceStringPointer = 0;

  @override
  void initState() {
    for (int i = 0; i < int.parse(frameController.text); i++) {
      stackValues[i] = -1;
    }
    super.initState();
    lastInIndex = 0;
    mytimer.cancel();
    mytimer1.cancel();
  }

  void reset() {
    stringResult = List<String>.filled(20, "-");
    isHit = false;
    hitIndex = -1;
    bottomText = "";
    bottomTextColor = Colors.transparent;
    for (int i = 0; i < int.parse(frameController.text); i++) {
      stackValues[i] = -1;
    }
    lastInIndex = 0;
    Frame0 = const SizedBox();
    Frame1 = const SizedBox();
    Frame2 = const SizedBox();
    Frame3 = const SizedBox();
    Frame4 = const SizedBox();
    Frame5 = const SizedBox();
    Frame6 = const SizedBox();
    referenceStringPointer = 0;
  }

  String countPageFault() {
    int temp = 0;
    for (int i = 0; i < stringResult.length; i++) {
      if (stringResult[i] == 'M') {
        temp++;
      }
    }
    return temp.toString();
  }

  @override
  Widget build(BuildContext context) {
    final pagesIds = Provider.of<ProviderClass>(context).pagesIds;

    void LIFOFunction() async {
      if (referenceStringPointer < int.parse(pageController.text)) {
        if (lastInIndex >= int.parse(frameController.text)) {
          lastInIndex = 0;
        }
        for (int i = 0; i < int.parse(frameController.text); i++) {
          if (pagesIds[referenceStringPointer] != -1 &&
              pagesIds[referenceStringPointer] == stackValues[i]) {
            isHit = true;
            hitIndex = i;
            bottomText = "Hit";
            bottomTextColor = Theme.of(context).scaffoldBackgroundColor;
          }
        }
        if (isHit == false) {
          bottomText = "Miss";
          bottomTextColor = Colors.redAccent;
          if (stackValues[0] == -1) {
            Frame0 = newPage(pagesIds[referenceStringPointer], 0, true);
            stackValues[0] = pagesIds[referenceStringPointer];
            stringResult[referenceStringPointer] = "M";
            referenceStringPointer++;
            lastInIndex = 0;
          } else if (stackValues[1] == -1) {
            Frame1 = newPage(pagesIds[referenceStringPointer], 1, true);
            stackValues[1] = pagesIds[referenceStringPointer];
            stringResult[referenceStringPointer] = "M";
            referenceStringPointer++;
            lastInIndex = 1;
          } else if (stackValues[2] == -1) {
            Frame2 = newPage(pagesIds[referenceStringPointer], 2, true);
            stackValues[2] = pagesIds[referenceStringPointer];
            stringResult[referenceStringPointer] = "M";
            referenceStringPointer++;
            lastInIndex = 2;
          } else if (stackValues[3] == -1) {
            Frame3 = newPage(pagesIds[referenceStringPointer], 3, true);
            stackValues[3] = pagesIds[referenceStringPointer];
            stringResult[referenceStringPointer] = "M";
            referenceStringPointer++;
            lastInIndex = 3;
          } else if (stackValues[4] == -1) {
            Frame4 = newPage(pagesIds[referenceStringPointer], 4, true);
            stackValues[4] = pagesIds[referenceStringPointer];
            stringResult[referenceStringPointer] = "M";
            referenceStringPointer++;
            lastInIndex = 4;
          } else if (stackValues[5] == -1) {
            Frame5 = newPage(pagesIds[referenceStringPointer], 5, true);
            stackValues[5] = pagesIds[referenceStringPointer];
            stringResult[referenceStringPointer] = "M";
            referenceStringPointer++;
            lastInIndex = 5;
          } else if (stackValues[6] == -1) {
            Frame6 = newPage(pagesIds[referenceStringPointer], 6, true);
            stackValues[6] = pagesIds[referenceStringPointer];
            stringResult[referenceStringPointer] = "M";
            referenceStringPointer++;
            lastInIndex = 6;
          } else {
            for (int i = 0; i < stackValues.length; i++) {
              if (lastInIndex == 0) {
                Frame0 = newPage(stackValues[0], 0, false);
                stackValues[0] = -1;

                break;
              } else if (lastInIndex == 1) {
                Frame1 = newPage(stackValues[1], 1, false);
                stackValues[1] = -1;

                break;
              } else if (lastInIndex == 2) {
                Frame2 = newPage(stackValues[2], 2, false);
                stackValues[2] = -1;

                break;
              } else if (lastInIndex == 3) {
                Frame3 = newPage(stackValues[3], 3, false);
                stackValues[3] = -1;

                break;
              } else if (lastInIndex == 4) {
                Frame4 = newPage(stackValues[4], 4, false);
                stackValues[4] = -1;

                break;
              } else if (lastInIndex == 5) {
                Frame5 = newPage(stackValues[5], 5, false);
                stackValues[5] = -1;

                break;
              } else if (lastInIndex == 6) {
                Frame6 = newPage(stackValues[6], 6, false);
                stackValues[6] = -1;

                break;
              }
            }
          }
        } else {
          for (int i = 0; i < stackValues.length; i++) {
            if (hitIndex == i) {
              HitFrame = hitPage(stackValues[i], i, true);
              stringResult[referenceStringPointer] = "H";
              referenceStringPointer++;
              setState(() {});
              await Future.delayed(const Duration(seconds: 1));
              HitFrame = hitPage(stackValues[i], i, false);
              setState(() {});
            }
          }
          isHit = false;
          hitIndex = -1;
        }
      } else {
        referenceStringPointer++;
        bottomText = "Total Page Fault: ${countPageFault()}";
        bottomTextColor = const Color.fromARGB(255, 131, 131, 131);
        isStarted = false;
        mytimer.cancel();
      }
    }

    return SingleChildScrollView(
      child: Container(
        child: Center(
          child: Card(
            color: Colors.white,
            elevation: 5,
            surfaceTintColor: Colors.white,
            margin: const EdgeInsets.symmetric(vertical: 50),
            child: SizedBox(
              width: 900,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: InkWell(
                          onTap: () {
                            mytimer.cancel();
                            pageIndex = 0;
                            tabController.animateTo(0);
                          },
                          borderRadius: BorderRadius.circular(8),
                          child: Ink(
                            width: 80,
                            height: 40,
                            decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: const Center(
                                child: Text(
                              "Back",
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                      ),
                      MediaQuery.of(context).size.width >= 550
                          ? Container(
                              margin: const EdgeInsets.only(top: 40),
                              child: Text(
                                "LIFO Page Replacement Algorithm",
                                style: TextStyle(
                                    fontFamily: "WorkSans",
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          : Container(
                              margin: const EdgeInsets.only(top: 40),
                              child: Text(
                                "LIFO Algorithm",
                                style: TextStyle(
                                    fontFamily: "WorkSans",
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                      Container(
                        width: 80,
                        height: 40,
                        margin: const EdgeInsets.only(right: 20),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      mytimer.isActive
                          ? const SizedBox()
                          : Container(
                              margin: const EdgeInsets.all(20),
                              child: InkWell(
                                hoverColor: const Color.fromARGB(23, 0, 0, 0),
                                onTap: mytimer.isActive
                                    ? null
                                    : () {
                                        reset();
                                        setState(() {});
                                      },
                                borderRadius: BorderRadius.circular(8),
                                child: Ink(
                                  width: 80,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 119, 119, 119))),
                                  child: const Center(
                                      child: Text(
                                    "Reset",
                                    style: TextStyle(color: Colors.black),
                                  )),
                                ),
                              ),
                            ),
                      Container(
                        margin: const EdgeInsets.all(20),
                        child: InkWell(
                          onTap: () {
                            if (mytimer.isActive == false &&
                                referenceStringPointer >=
                                    int.parse(pageController.text)) {
                              reset();
                              isStarted = true;
                              setState(() {});

                              mytimer = Timer.periodic(
                                  const Duration(seconds: 2), (timer) {
                                setState(() {});
                                LIFOFunction();
                                setState(() {});
                              });
                            } else if (mytimer.isActive) {
                              mytimer.cancel();
                              isStarted = false;
                              setState(() {});
                            } else {
                              isStarted = true;
                              setState(() {});
                              mytimer = Timer.periodic(
                                  const Duration(seconds: 2), (timer) {
                                setState(() {});
                                LIFOFunction();
                                setState(() {});
                              });
                            }
                          },
                          borderRadius: BorderRadius.circular(8),
                          child: Ink(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                                child: isStarted == true
                                    ? const Icon(Icons.pause,
                                        color: Colors.white)
                                    : isStarted == false &&
                                            referenceStringPointer >=
                                                int.parse(pageController.text)
                                        ? const Text(
                                            "Restart",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )
                                        : const Text(
                                            "Animate",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                          ),
                        ),
                      ),
                      mytimer.isActive
                          ? const SizedBox()
                          : Container(
                              margin: const EdgeInsets.all(20),
                              child: InkWell(
                                hoverColor: const Color.fromARGB(23, 0, 0, 0),
                                onTap: mytimer.isActive || mytimer1.isActive
                                    ? null
                                    : () {
                                        LIFOFunction();
                                        setState(() {});
                                        mytimer1 = Timer.periodic(
                                            const Duration(seconds: 2),
                                            (timer) {
                                          timer.cancel();
                                          setState(() {});
                                        });
                                      },
                                borderRadius: BorderRadius.circular(8),
                                child: Ink(
                                  width: 80,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 119, 119, 119))),
                                  child: const Center(
                                      child: Icon(Icons.navigate_next_sharp)),
                                ),
                              ),
                            ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: Text("Refrence String",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.grey, fontSize: 16)),
                  ),
                  Container(
                      height: 85,
                      margin: const EdgeInsets.all(10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0;
                                i < int.parse(pageController.text);
                                i++)
                              Column(
                                children: [
                                  AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      width: referenceStringPointer - 1 == i ||
                                              (isStarted == true &&
                                                  referenceStringPointer == 0 &&
                                                  i == 0)
                                          ? 40
                                          : 30,
                                      height: referenceStringPointer - 1 == i ||
                                              (isStarted == true &&
                                                  referenceStringPointer == 0 &&
                                                  i == 0)
                                          ? 40
                                          : 30,
                                      margin: const EdgeInsets.only(
                                          left: 5, right: 5, top: 5, bottom: 0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          border: Border.all(
                                              color: referenceStringPointer -
                                                              1 ==
                                                          i ||
                                                      (isStarted == true &&
                                                          referenceStringPointer == 0 &&
                                                          i == 0)
                                                  ? Colors.black
                                                  : Colors.grey)),
                                      child: Center(
                                          child: Text(
                                        pagesIds[i].toString(),
                                        style: TextStyle(
                                            fontSize: referenceStringPointer -
                                                            1 ==
                                                        i ||
                                                    (isStarted == true &&
                                                        referenceStringPointer ==
                                                            0 &&
                                                        i == 0)
                                                ? 20
                                                : 16,
                                            color: referenceStringPointer -
                                                            1 ==
                                                        i ||
                                                    (isStarted ==
                                                            true &&
                                                        referenceStringPointer ==
                                                            0 &&
                                                        i == 0)
                                                ? Colors.blue
                                                : const Color.fromARGB(
                                                    255, 99, 99, 99)),
                                      ))),
                                  AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      width: referenceStringPointer - 1 == i ||
                                              (isStarted == true &&
                                                  referenceStringPointer == 0 &&
                                                  i == 0)
                                          ? 40
                                          : 30,
                                      height: referenceStringPointer - 1 == i ||
                                              (isStarted == true &&
                                                  referenceStringPointer == 0 &&
                                                  i == 0)
                                          ? 40
                                          : 30,
                                      margin: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      child: Center(
                                          child: Text(
                                        stringResult[i],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: stringResult[i] == "M"
                                                ? Colors.redAccent
                                                : stringResult[i] == "H"
                                                    ? Theme.of(context)
                                                        .scaffoldBackgroundColor
                                                    : Colors.transparent),
                                      ))),
                                ],
                              )
                          ],
                        ),
                      )),
                  SizedBox(
                    width: 100,
                    height: int.parse(frameController.text) * 60,
                    child: Stack(
                      children: [
                        for (int i = 0;
                            i < int.parse(frameController.text);
                            i++)
                          Positioned(
                            top: i * 60,
                            child: Container(
                              width: 100,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey)),
                            ),
                          ),
                        stackValues[0] == -2 ? const SizedBox() : Frame0,
                        stackValues[1] == -2 ? const SizedBox() : Frame1,
                        stackValues[2] == -2 ? const SizedBox() : Frame2,
                        stackValues[3] == -2 ? const SizedBox() : Frame3,
                        stackValues[4] == -2 ? const SizedBox() : Frame4,
                        stackValues[5] == -2 ? const SizedBox() : Frame5,
                        stackValues[6] == -2 ? const SizedBox() : Frame6,
                        HitFrame
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30, bottom: 20),
                    child: Text(
                      bottomText,
                      style: TextStyle(
                        fontSize: 19,
                        color: bottomTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
