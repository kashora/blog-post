import 'package:blog_poster/Util/Viewmodel.dart';
import 'package:flutter/cupertino.dart';

class Search_viewmodel extends Viewmodel {
  String _text = '1234';
  String get_text() => _text;

  void search(String text) {
    //print the id of the search_viewmodel
    print(this.hashCode);
    _text = text;
    print(get_text());
    notifyListeners();
  }
}
