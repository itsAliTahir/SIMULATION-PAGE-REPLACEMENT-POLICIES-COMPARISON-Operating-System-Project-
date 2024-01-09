// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:os_project/guide.dart';
import '../../global_data.dart';
// import 'package:url_launcher/url_launcher.dart';

class MyInputFields extends StatefulWidget {
  const MyInputFields({super.key});

  @override
  State<MyInputFields> createState() => _MyInputFieldsState();
}

class _MyInputFieldsState extends State<MyInputFields> {
  final int minPageLimit = 1;
  final int maxPageLimit = 20;
  final int minFrameLimit = 1;
  final int maxFrameLimit = 7;

  @override
  Widget build(BuildContext context) {
    // launchURL(String url) async {
    //   if (await canLaunch(url)) {
    //     await launch(url);
    //   } else {
    //     throw 'Could not launch $url';
    //   }
    // }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
              alignment: Alignment.topRight,
              child: Container(
                  margin: const EdgeInsets.only(right: 20, bottom: 30, top: 20),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 222, 222, 222)),
                      borderRadius: BorderRadius.circular(40)),
                  child: TextButton(
                      onPressed: () {
                        print(MediaQuery.of(context).size.height);
                        showDialog(
                          context: context,
                          // barrierColor: Colors.transparent,
                          builder: (BuildContext context) {
                            // Return the dialog widget
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              surfaceTintColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              title:
                                  const Center(child: Text('Tutorial Guide')),
                              content: Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                  width:
                                      MediaQuery.of(context).size.width > 1000
                                          ? 900
                                          : double.infinity,
                                  child: const MyGuide()),
                              actions: [
                                // OK button
                                Center(
                                  child: TextButton(
                                    onPressed: () {
                                      // Close the dialog
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'Close',
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                        // Call the showDialog function
                        // showDialog(
                        //   context: context,
                        //   builder: (BuildContext context) {
                        //     // Return the AlertDialog
                        //     return AlertDialog(
                        //       title: const Text('Project Assets'),
                        //       content: SizedBox(
                        //         height: 150,
                        //         child: Column(
                        //             mainAxisAlignment:
                        //                 MainAxisAlignment.spaceEvenly,
                        //             children: [
                        //               ElevatedButton(
                        //                 onPressed: () {
                        //                   const String urlToOpen =
                        //                       'https://github.com/itsAliTahir/SIMULATION-PAGE-REPLACEMENT-POLICIES-COMPARISON-Operating-System-Project-/blob/master/README.md';
                        //                   launchURL(urlToOpen);
                        //                 },
                        //                 child: Text(
                        //                   "Readme File",
                        //                   style: TextStyle(
                        //                       color: Theme.of(context)
                        //                           .scaffoldBackgroundColor),
                        //                 ),
                        //               ),
                        //               ElevatedButton(
                        //                 onPressed: () {
                        //                   const String urlToOpen =
                        //                       'https://github.com/itsAliTahir/SIMULATION-PAGE-REPLACEMENT-POLICIES-COMPARISON-Operating-System-Project-';

                        //                   launchURL(urlToOpen);
                        //                 },
                        //                 child: Text(
                        //                   "Source Code",
                        //                   style: TextStyle(
                        //                       color: Theme.of(context)
                        //                           .scaffoldBackgroundColor),
                        //                 ),
                        //               ),
                        //               ElevatedButton(
                        //                 onPressed: () {
                        //                   const String urlToOpen =
                        //                       'https://drive.google.com/file/d/1Sm_yit8zbmMGVlQx9TD3WRsQRAePqjGb/view?usp=drive_link';

                        //                   launchURL(urlToOpen);
                        //                 },
                        //                 child: Text(
                        //                   "Tutorial Documentation",
                        //                   style: TextStyle(
                        //                       color: Theme.of(context)
                        //                           .scaffoldBackgroundColor),
                        //                 ),
                        //               ),
                        //             ]),
                        //       ),
                        //       actions: <Widget>[
                        //         TextButton(
                        //           onPressed: () {
                        //             // Close the dialog
                        //             Navigator.of(context).pop();
                        //           },
                        //           child: Text(
                        //             'Close',
                        //             style: TextStyle(
                        //                 color: Theme.of(context)
                        //                     .scaffoldBackgroundColor),
                        //           ),
                        //         ),
                        //       ],
                        //     );
                        //   },
                        // );
                      },
                      child: Text(
                        "Tutorial",
                        style: TextStyle(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            fontWeight: FontWeight.bold),
                      )))),
          Container(
            margin: const EdgeInsets.only(left: 75),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text("Number of Frames",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  )),
            ),
          ),
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width < 280
                ? MediaQuery.of(context).size.width * 0.9
                : 250,
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: frameController,
              onChanged: (value) {
                if (value.isNotEmpty && int.parse(value) > maxFrameLimit) {
                  frameController =
                      TextEditingController(text: maxFrameLimit.toString());
                } else if (value.isNotEmpty &&
                    int.parse(value) < minFrameLimit) {
                  frameController =
                      TextEditingController(text: minFrameLimit.toString());
                }
                setState(() {});
              },
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2,
                        color: Theme.of(context).scaffoldBackgroundColor)),
                border: const OutlineInputBorder(),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (frameController.text.isNotEmpty &&
                            int.parse(frameController.text) > minFrameLimit) {
                          int temp = int.parse(frameController.text);
                          temp--;
                          frameController =
                              TextEditingController(text: temp.toString());

                          setState(() {});
                        }
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    IconButton(
                      onPressed: () {
                        if (frameController.text.isNotEmpty &&
                            int.parse(frameController.text) < maxFrameLimit) {
                          int temp = int.parse(frameController.text);

                          temp++;
                          frameController =
                              TextEditingController(text: temp.toString());

                          setState(() {});
                        }
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 75),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text("Number of Pages",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.grey, fontSize: 16)),
            ),
          ),
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width < 280
                ? MediaQuery.of(context).size.width * 0.9
                : 250,
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(2),
                FilteringTextInputFormatter.digitsOnly,
              ],
              controller: pageController,
              onChanged: (value) {
                if (value.isNotEmpty && int.parse(value) > maxPageLimit) {
                  pageController =
                      TextEditingController(text: maxPageLimit.toString());
                } else if (value.isNotEmpty &&
                    int.parse(value) < minPageLimit) {
                  pageController =
                      TextEditingController(text: minPageLimit.toString());
                }
                setState(() {});
              },
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2,
                        color: Theme.of(context).scaffoldBackgroundColor)),
                border: const OutlineInputBorder(),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (pageController.text.isNotEmpty &&
                            int.parse(pageController.text) > minPageLimit) {
                          int temp = int.parse(pageController.text);
                          temp--;
                          pageController =
                              TextEditingController(text: temp.toString());
                          setState(() {});
                        }
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    IconButton(
                      onPressed: () {
                        if (pageController.text.isNotEmpty &&
                            int.parse(pageController.text) < maxPageLimit) {
                          int temp = int.parse(pageController.text);
                          temp++;
                          pageController =
                              TextEditingController(text: temp.toString());
                          setState(() {});
                        }
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
