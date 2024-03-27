// ignore_for_file: prefer_const_constructors

//import 'dart:ffi';

import 'dart:developer';

import 'package:blog_poster/Util/Viewmodel.dart';
import 'package:blog_poster/View/Home_view.dart';
import 'package:blog_poster/View/Profile_view.dart';
import 'package:blog_poster/View/Search_view.dart';
import 'package:blog_poster/Viewmodel/Main_viewmodel.dart';
import 'package:blog_poster/Viewmodel/Search_viewmode.dart';
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
    _viewModel.setContext(context);
    return SafeArea(
      child: Consumer<MainViewModel>(builder: (context, viewModel, child) {
        return Scaffold(
            drawer: Drawer(
              width: 200,
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    // decoration: Decoration.,
                    child: Center(
                      child: Text('Blog\nPoster',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontStyle: FontStyle.italic)),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: const Text('Item 2'),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                ],
              ),
            ),

            //  appBar: _viewModel.getCurrentAppBar(), //_appBar[_index],

            body: ChangeNotifierProvider<Viewmodel>(
                create: (context) {
                  return _viewModel.getCurrentViewModel();
                },
                child: Scaffold(
                    appBar: _viewModel.getCurrentAppBar(),
                    body: _viewModel.getCurrentBody())),
            bottomNavigationBar: BottomNavigationBar(
                onTap: _viewModel.navigateBottomBar,
                currentIndex: _viewModel.index,
                selectedItemColor: Colors.black,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search), label: "Search"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: "Profile")
                ]));
      }),
    );
  }
}
