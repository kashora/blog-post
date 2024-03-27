import 'package:blog_poster/Util/Viewmodel.dart';
import 'package:flutter/cupertino.dart';

class Home_viewmodel extends Viewmodel {
  String _text = '';
  String get text => _text;

  void search(String text) {
    _text = text;
    notifyListeners();

    print(text);
  }
}
