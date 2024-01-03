import 'package:flutter/material.dart';

var frameController = TextEditingController(text: "4");
var pageController = TextEditingController(text: "12");

List<FocusNode> focusNodes = List.generate(20, (index) => FocusNode());

int MainpageIndex = 0;
final controllerMain = PageController(initialPage: 1);
