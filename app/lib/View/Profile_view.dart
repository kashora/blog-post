import 'package:blog_poster/Util/appBar_view.dart';
import 'package:blog_poster/Util/view.dart';
import 'package:blog_poster/Viewmodel/profile_viewmodel.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return BaseView<ProfileViewModel>(
        vmBuilder: (context) => ProfileViewModel(), builder: _buildScreen);
  }

  Widget _buildScreen(BuildContext context, ProfileViewModel vm) => Scaffold(
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
      body: Container(
        child: Text('test'),
      ));
}
