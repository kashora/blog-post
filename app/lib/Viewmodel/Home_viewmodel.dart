import 'dart:async';

import 'package:blog_poster/Util/view_model.dart';

class HomeViewModel extends BaseViewModel {
  String _text = '';
  String get text => _text;

  void search(String text) {
    _text = text;
    notifyListeners();

    print(text);
  }

  FutureOr<void> init() async {
    print('Search_viewmodel init');
    //changeStatus();
  }
}
