import 'package:flutter/cupertino.dart';

abstract class Viewmodel extends ChangeNotifier {
  BuildContext? context;

  void setContext(BuildContext context) => this.context = context;
  //String _text = '';
  //String get text => _text;
}
