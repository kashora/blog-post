// ignore_for_file: prefer_const_constructors

import 'package:blog_poster/Util/AppBar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeBody extends StatelessWidget {
  HomeBody({super.key});
  @override
  Widget build(BuildContext) {
    return Scaffold(body: Center(child: Text('Home')));
  }
}

class HomeAppBar extends CustomizableAppBar {
  HomeAppBar({super.key})
      : super(child: Builder(builder: (context) {
          return Row(
            children: [
              Flexible(
                  flex: 1,
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    color: Colors.white,
                    onPressed: () {
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
          );
        }));
}
