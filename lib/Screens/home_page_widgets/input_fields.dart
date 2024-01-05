import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../global_data.dart';

class MyInputFields extends StatefulWidget {
  const MyInputFields({super.key});

  @override
  State<MyInputFields> createState() => _MyInputFieldsState();
}

class _MyInputFieldsState extends State<MyInputFields> {
  final int minPageLimit = 5;
  final int maxPageLimit = 20;
  final int minFrameLimit = 2;
  final int maxFrameLimit = 7;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 75),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text("Total Frames",
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
              child: Text("Total Pages",
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
