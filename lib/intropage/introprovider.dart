import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class IntroRepo extends ChangeNotifier{
  int _scrollIndex = 0;
  final controller = PageController();

  int get scrollIndex => _scrollIndex;

  setScrollIndex(value, controller) {
    _scrollIndex = value + 1;
    controller!.jumpToPage(_scrollIndex);

    notifyListeners();
  }

  onPageViewChange(int currentPage) {
    _scrollIndex = currentPage;
  }

}