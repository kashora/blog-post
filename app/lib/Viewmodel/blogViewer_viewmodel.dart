import 'dart:async';

import 'package:blog_poster/Model/blog_model.dart';
import 'package:blog_poster/Util/view_model.dart';

class BlogViewerViewModel extends BaseViewModel {
  String _text = '';
  String get text => _text;

  late BlogModel _blog;

  BlogModel get_blog() => _blog;

  void search(String text) {
    _text = text;
    notifyListeners();

    print(text);
  }

  FutureOr<void> init() async {
    //print('Search_viewmodel init');
    //changeStatus();
  }
}
