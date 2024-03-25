import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  ProfileAppBar({super.key});
  double height = 56.0;
  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Colors.blue,
      alignment: Alignment.center,
      child: Row(
        children: [
          Flexible(
              flex: 1,
              child: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              )),
          Flexible(
            flex: 3,
            child: Container(
              //color: Colors.white,
              child: TextField(
                onSubmitted: (value) {
                  print(value);
                },
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                    hintText: "Profile",
                    contentPadding: EdgeInsets.all(10),
                    filled: true,
                    fillColor: Colors.white30,
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileBody extends StatelessWidget {
  ProfileBody({super.key});
  @override
  Widget build(BuildContext) {
    return Scaffold(body: Center(child: Text('Profile')));
  }
}
