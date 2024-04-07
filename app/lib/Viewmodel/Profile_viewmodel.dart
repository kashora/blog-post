import 'dart:async';

import 'package:blog_poster/Util/Viewmodel.dart';
import 'package:flutter/cupertino.dart';

class Profile_viewmodel extends BaseViewModel {
  String _text = '';
  String get text => _text;

  void search(String text) {
    _text = text;
    notifyListeners();

    print(text);
  }

  @override
  FutureOr<void> init() {
    // TODO: implement init
    throw UnimplementedError();
  }
}
