import 'package:flutter/material.dart';

var frameController = TextEditingController(text: "4");
var pageController = TextEditingController(text: "12");

List<FocusNode> focusNodes = List.generate(20, (index) => FocusNode());

int pageIndex = 0;
int MainpageIndex = 0;
final controllerMain = PageController(initialPage: 0);
final slideController = PageController(initialPage: 0);
