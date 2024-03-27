import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomizableAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  CustomizableAppBar({super.key, required this.child});
  Widget child;
  double height = 56.0;
  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar_container(child);
  }
}

Widget AppBar_container(Widget child) {
  return Container(
    height: 56.0,
    color: Color.fromARGB(255, 15, 6, 3),
    alignment: Alignment.center,
    child: child,
  );
}

