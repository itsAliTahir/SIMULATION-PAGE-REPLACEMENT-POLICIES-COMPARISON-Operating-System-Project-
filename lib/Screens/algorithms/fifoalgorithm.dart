import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/data_provider.dart';
import '../../global_data.dart';

class MyFIFOAlgorithm extends StatelessWidget {
  const MyFIFOAlgorithm({super.key});

  @override
  Widget build(BuildContext context) {
    final pagesIds = Provider.of<ProviderClass>(context).pagesIds;
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: Card(
          color: Colors.white,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.white,
          margin: const EdgeInsets.all(50),
          child: SizedBox(
            width: 900,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: InkWell(
                          onTap: () {
                            controllerMain.animateToPage(0,
                                curve: Curves.linear,
                                duration: const Duration(milliseconds: 500));
                          },
                          borderRadius: BorderRadius.circular(20),
                          child: Ink(
                            width: 80,
                            height: 40,
                            decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
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
                        margin: EdgeInsets.only(right: 20),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      for (int i = 0; i < int.parse(pageController.text); i++)
                        Text(pagesIds[i].toString())
                    ],
                  ),
                  Container(
                    width: 100,
                    height: 550,
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
                                  color: Colors.white, border: Border.all()),
                            ),
                          ),
                        DelayedDisplay(
                          delay: Duration(seconds: 2),
                          slidingBeginOffset: Offset(-2, 0),
                          child: Container(
                            width: 100,
                            height: 60,
                            margin: EdgeInsets.only(top: 60),
                            decoration: BoxDecoration(
                                color: Colors.red, border: Border.all()),
                          ),
                        )
                      ],
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
