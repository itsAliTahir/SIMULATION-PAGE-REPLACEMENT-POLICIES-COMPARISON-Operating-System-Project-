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
  final int minFrameLimit = 3;
  final int maxFrameLimit = 7;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Total Frames",
            style: TextStyle(color: Colors.grey, fontSize: 16)),
        SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width < 280
              ? MediaQuery.of(context).size.width * 0.9
              : 250,
          child: TextFormField(
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            controller: frameController,
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
        const Text("Total Pages",
            style: TextStyle(color: Colors.grey, fontSize: 16)),
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
    );
  }
}
