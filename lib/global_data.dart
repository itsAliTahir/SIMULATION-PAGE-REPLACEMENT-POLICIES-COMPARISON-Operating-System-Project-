import 'package:flutter/material.dart';

var frameController = TextEditingController(text: "4");
var pageController = TextEditingController(text: "12");

List<FocusNode> focusNodes = List.generate(20, (index) => FocusNode());

int pageIndex = 0;
int mainpageIndex = 0;
int algorithmIndex = 2;

late TabController tabController;
final slideController = PageController(initialPage: 0);
