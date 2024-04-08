// ignore_for_file: prefer_const_constructors

import 'package:blog_poster/Util/appBar_view.dart';
import 'package:blog_poster/Util/view.dart';
import 'package:blog_poster/Viewmodel/home_viewmodel.dart';
import 'package:blog_poster/Viewmodel/Search_viewmode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        vmBuilder: (context) => HomeViewModel(), builder: _buildScreen);
  }

  Widget _buildScreen(BuildContext context, HomeViewModel vm) => Scaffold(
      appBar: CustomizableAppBar(
          child: Row(
        children: [
          Flexible(
              flex: 1,
              child: IconButton(
                icon: Icon(Icons.menu),
                color: Colors.white,
                onPressed: () {
                  print('open drawer');
                  Scaffold.of(context).openDrawer();
                },
              )),
          Flexible(
              flex: 3,
              child: Text(
                "Home",
                style: TextStyle(
                    color: Colors.white,
                    //fontStyle: FontStyle.italic,
                    fontSize: 30,
                    fontWeight: FontWeight.w300),
              )),
        ],
      )),
      body: vm.isInitialized
          ? Row(children: [Center(child: Text('test'))])
          : Container(
              color: Colors.white,
              child: Center(child: CircularProgressIndicator())));
}
