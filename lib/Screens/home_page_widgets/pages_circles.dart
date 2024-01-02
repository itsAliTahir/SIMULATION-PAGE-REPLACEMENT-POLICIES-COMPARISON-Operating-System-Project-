import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:os_project/global_data.dart';

class MyPagesCircles extends StatelessWidget {
  const MyPagesCircles({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        // for (int i = 0; i < int.parse(pageController.text); i++)
        for (int i = 0; i < 20; i++)
          Container(
            width: 60,
            height: 60,
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                border: Border.all(
                    color: const Color.fromARGB(255, 129, 129, 129))),
            child: Center(
                child: TextFormField(
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(2),
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                  border: UnderlineInputBorder(borderSide: BorderSide.none)),
            )),
          )
      ],
    );
  }
}
