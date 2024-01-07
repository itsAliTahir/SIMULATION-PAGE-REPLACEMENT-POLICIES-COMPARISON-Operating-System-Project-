import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:os_project/global_data.dart';
import 'package:provider/provider.dart';
import '../../Provider/data_provider.dart';

class MyPagesCircles extends StatefulWidget {
  const MyPagesCircles({super.key});

  @override
  State<MyPagesCircles> createState() => _MyPagesCirclesState();
}

class _MyPagesCirclesState extends State<MyPagesCircles> {
  int selectedBox = -1;

  @override
  Widget build(BuildContext context) {
    final pagesIds = Provider.of<ProviderClass>(context).pagesIds;
    final changePageId = Provider.of<ProviderClass>(context).changeId;
    final autoGenerate = Provider.of<ProviderClass>(context).autoGenerate;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 50),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text("Enter Page IDs",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.grey, fontSize: 16)),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
            child: Wrap(
              children: [
                for (int index = 0;
                    index < int.parse(pageController.text);
                    index++)
                  GestureDetector(
                    onTap: () {
                      selectedBox = index;
                      for (int i = 0; i < 20; i++) {
                        focusNodes[i].unfocus();
                      }
                      focusNodes[index].requestFocus();
                      setState(() {});
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45),
                          border: Border.all(
                              color: const Color.fromARGB(255, 129, 129, 129))),
                      child: Center(
                          child: Container(
                        margin: const EdgeInsets.only(bottom: 6),
                        child: selectedBox == index
                            ? TextFormField(
                                style: const TextStyle(fontSize: 14.0),
                                textAlign: TextAlign.center,
                                focusNode: focusNodes[index],
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(2),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: const InputDecoration(
                                    border: UnderlineInputBorder(
                                        borderSide: BorderSide.none)),
                                onChanged: (value) {
                                  changePageId(index, int.parse(value));
                                },
                                onTapOutside: (event) {
                                  selectedBox = -1;
                                  setState(() {});
                                },
                              )
                            : Text(
                                pagesIds[index].toString(),
                                style: TextStyle(
                                    color: pagesIds[index] == -1
                                        ? Colors.transparent
                                        : Colors.black),
                              ),
                      )),
                    ),
                  )
              ],
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                autoGenerate();
              },
              borderRadius: BorderRadius.circular(10),
              child: Ink(
                width: 130,
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "Auto Generate",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
