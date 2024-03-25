// ignore_for_file: prefer_const_constructors

//import 'dart:ffi';

import 'package:blog_poster/View/Home_view.dart';
import 'package:blog_poster/View/Profile_view.dart';
import 'package:blog_poster/View/Search_view.dart';
import 'package:blog_poster/Viewmodel/Main_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final MainViewModel _viewModel;
  @override
  void initState() {
    super.initState();
    _viewModel = Provider.of<MainViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Consumer<MainViewModel>(builder: (context, viewModel, child) {
      return Scaffold(
          drawer: Drawer(),
          appBar: _viewModel.getCurrentAppBar(), //_appBar[_index],
          body: _viewModel.getCurrentPage(), //_body[_index],
          bottomNavigationBar: BottomNavigationBar(
              onTap: _viewModel.navigateBottomBar,
              currentIndex: _viewModel.index,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: "Search"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Profile")
              ]));
    }));
  }
}
