// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:blog_poster/View/Home_view.dart';
import 'package:blog_poster/View/Profile_view.dart';
import 'package:blog_poster/View/Search_view.dart';
import 'package:flutter/material.dart';

class MainViewModel extends ChangeNotifier {
  int index = 1;

  final List pages = [HomeBody(), SearchBody(), ProfileBody()];
  final List<PreferredSizeWidget> appBars = [
    HomeAppBar(),
    SearchAppBar(),
    ProfileAppBar()
  ];

  PreferredSizeWidget getCurrentAppBar() {
    print(index);
    return appBars[index];
  }

  Widget getCurrentPage() => pages[index];

  void navigateBottomBar(int _index) {
    index = _index;
    //print(index);
    notifyListeners();
  }
}
