import 'package:blog_poster/Util/AppBar_view.dart';
import 'package:flutter/material.dart';

class ProfileAppBar extends CustomizableAppBar {
  ProfileAppBar({super.key})
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
                    "Profile",
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

class ProfileBody extends StatelessWidget {
  ProfileBody({super.key});
  @override
  Widget build(BuildContext) {
    return Scaffold(body: Center(child: Text('Profile')));
  }
}
