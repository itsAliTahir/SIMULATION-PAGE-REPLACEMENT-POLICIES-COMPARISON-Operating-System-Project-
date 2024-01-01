import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyInputFields extends StatefulWidget {
  const MyInputFields({super.key});

  @override
  State<MyInputFields> createState() => _MyInputFieldsState();
}

class _MyInputFieldsState extends State<MyInputFields> {
  @override
  Widget build(BuildContext context) {
    final _frameController = TextEditingController();
    final _pageController = TextEditingController();
    return Container(
      width: MediaQuery.of(context).size.width < 330
          ? MediaQuery.of(context).size.width * 0.9
          : 300,

      // color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Total Frames",
              style: TextStyle(color: Colors.grey, fontSize: 16)),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width < 280
                ? MediaQuery.of(context).size.width * 0.9
                : 250,
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: _frameController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.remove),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text("Total Pages",
              style: TextStyle(color: Colors.grey, fontSize: 16)),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width < 280
                ? MediaQuery.of(context).size.width * 0.9
                : 250,
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: _pageController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.remove),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add),
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
