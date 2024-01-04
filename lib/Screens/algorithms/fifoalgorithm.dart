import 'dart:async';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Provider/data_provider.dart';
import '../../global_data.dart';

class MyFIFOAlgorithm extends StatefulWidget {
  const MyFIFOAlgorithm({super.key});

  @override
  State<MyFIFOAlgorithm> createState() => _MyFIFOAlgorithmState();
}

class _MyFIFOAlgorithmState extends State<MyFIFOAlgorithm> {
  List<int> stackValues = List<int>.filled(7, -2);
  List<String> stringResult = List<String>.filled(20, "-");
  bool isHit = false;
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
    margin: EdgeInsets.only(top: 5 * 60),
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
  int firstInIndex = -1;
  Timer mytimer = Timer.periodic(Duration.zero, (timer) {});
  int referenceStringPointer = 0;

  Widget newPage(
    int pageId,
    int positionIndex,
    bool fadeIn,
  ) {
    return DelayedDisplay(
      slidingBeginOffset: Offset(fadeIn ? -2.5 : 2.5, 0),
      fadeIn: fadeIn,
      fadingDuration: const Duration(seconds: 2),
      child: Container(
        width: 100,
        height: 60,
        margin: EdgeInsets.only(top: positionIndex * 60),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 132, 204, 255),
          border: Border.all(color: Colors.black),
        ),
        child: Center(
            child: Text(
          pageId.toString(),
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }

  Widget hitPage(
    int pageId,
    int positionIndex,
    bool fadeIn,
  ) {
    return DelayedDisplay(
      slidingBeginOffset: const Offset(0, 0),
      fadeIn: fadeIn,
      fadingDuration: const Duration(seconds: 1),
      child: Container(
        width: 100,
        height: 60,
        margin: EdgeInsets.only(top: positionIndex * 60),
        decoration: BoxDecoration(
            color: Colors.blue, border: Border.all(color: Colors.black)),
        child: Center(
            child: Text(
          pageId.toString(),
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }

  void initState() {
    for (int i = 0; i < int.parse(frameController.text); i++) {
      stackValues[i] = -1;
    }
    super.initState();
    firstInIndex = 0;
    mytimer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final pagesIds = Provider.of<ProviderClass>(context).pagesIds;

    void FIFOFunction() async {
      if (referenceStringPointer < int.parse(pageController.text)) {
        if (firstInIndex >= int.parse(frameController.text)) {
          firstInIndex = 0;
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
          } else if (stackValues[1] == -1) {
            Frame1 = newPage(pagesIds[referenceStringPointer], 1, true);
            stackValues[1] = pagesIds[referenceStringPointer];
            stringResult[referenceStringPointer] = "M";
            referenceStringPointer++;
          } else if (stackValues[2] == -1) {
            Frame2 = newPage(pagesIds[referenceStringPointer], 2, true);
            stackValues[2] = pagesIds[referenceStringPointer];
            stringResult[referenceStringPointer] = "M";
            referenceStringPointer++;
          } else if (stackValues[3] == -1) {
            Frame3 = newPage(pagesIds[referenceStringPointer], 3, true);
            stackValues[3] = pagesIds[referenceStringPointer];
            stringResult[referenceStringPointer] = "M";
            referenceStringPointer++;
          } else if (stackValues[4] == -1) {
            Frame4 = newPage(pagesIds[referenceStringPointer], 4, true);
            stackValues[4] = pagesIds[referenceStringPointer];
            stringResult[referenceStringPointer] = "M";
            referenceStringPointer++;
          } else if (stackValues[5] == -1) {
            Frame5 = newPage(pagesIds[referenceStringPointer], 5, true);
            stackValues[5] = pagesIds[referenceStringPointer];
            stringResult[referenceStringPointer] = "M";
            referenceStringPointer++;
          } else if (stackValues[6] == -1) {
            Frame6 = newPage(pagesIds[referenceStringPointer], 6, true);
            stackValues[6] = pagesIds[referenceStringPointer];
            stringResult[referenceStringPointer] = "M";
            referenceStringPointer++;
          } else {
            for (int i = 0; i < stackValues.length; i++) {
              if (firstInIndex == 0) {
                Frame0 = newPage(stackValues[0], 0, false);
                stackValues[0] = -1;
                firstInIndex++;
                break;
              } else if (firstInIndex == 1) {
                Frame1 = newPage(stackValues[1], 1, false);
                stackValues[1] = -1;
                firstInIndex++;
                break;
              } else if (firstInIndex == 2) {
                Frame2 = newPage(stackValues[2], 2, false);
                stackValues[2] = -1;
                firstInIndex++;
                break;
              } else if (firstInIndex == 3) {
                Frame3 = newPage(stackValues[3], 3, false);
                stackValues[3] = -1;
                firstInIndex++;
                break;
              } else if (firstInIndex == 4) {
                Frame4 = newPage(stackValues[4], 4, false);
                stackValues[4] = -1;
                firstInIndex++;
                break;
              } else if (firstInIndex == 5) {
                Frame5 = newPage(stackValues[5], 5, false);
                stackValues[5] = -1;
                firstInIndex++;
                break;
              } else if (firstInIndex == 6) {
                Frame6 = newPage(stackValues[6], 6, false);
                stackValues[6] = -1;
                firstInIndex++;
                break;
              }
            }
          }
        } else {
          for (int i = 0; i < stackValues.length; i++) {
            if (hitIndex == i) {
              HitFrame = hitPage(stackValues[i], i, true);
              setState(() {});
              await Future.delayed(Duration(seconds: 1));
              HitFrame = hitPage(stackValues[i], i, false);
              setState(() {});
            }
          }
          isHit = false;
          hitIndex = -1;
          stringResult[referenceStringPointer] = "H";
          referenceStringPointer++;
        }
      } else {
        referenceStringPointer++;
        bottomText = "Finished";
        bottomTextColor = const Color.fromARGB(255, 5, 208, 110);
        mytimer.cancel();
      }
      print(stackValues);
    }

    return SingleChildScrollView(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Center(
          child: Card(
            color: Colors.white,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.white,
            margin: const EdgeInsets.all(50),
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
                            controllerMain.animateToPage(0,
                                curve: Curves.linear,
                                duration: const Duration(milliseconds: 500));
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
                      Container(
                        margin: const EdgeInsets.only(top: 40),
                        child: Text(
                          "Algorithm Name",
                          style: TextStyle(
                              color: Theme.of(context).scaffoldBackgroundColor,
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
                  Container(
                    margin: EdgeInsets.all(20),
                    child: InkWell(
                      onTap: () {
                        if (mytimer.isActive) {
                        } else {
                          mytimer =
                              Timer.periodic(Duration(seconds: 2), (timer) {
                            FIFOFunction();
                            setState(() {});
                          });
                        }
                      },
                      borderRadius: BorderRadius.circular(8),
                      child: Ink(
                        width: 80,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Center(
                            child: Text(
                          "Animate",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            for (int i = 0;
                                i < int.parse(pageController.text);
                                i++)
                              AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  width:
                                      referenceStringPointer - 1 == i ? 40 : 30,
                                  height:
                                      referenceStringPointer - 1 == i ? 40 : 30,
                                  margin: const EdgeInsets.only(
                                      left: 5, right: 5, top: 5, bottom: 0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                          color: referenceStringPointer - 1 == i
                                              ? Colors.black
                                              : Colors.grey)),
                                  child: Center(
                                      child: Text(pagesIds[i].toString()))),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            for (int i = 0;
                                i < int.parse(pageController.text);
                                i++)
                              Container(
                                  width: 30,
                                  height: 30,
                                  margin:
                                      const EdgeInsets.only(left: 5, right: 5),
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
                        ),
                      ],
                    ),
                  ),
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
                    margin: const EdgeInsets.only(top: 30),
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
