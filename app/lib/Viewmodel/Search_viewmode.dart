import 'dart:async';

import 'package:blog_poster/Services/api_service.dart';
import 'package:blog_poster/Util/view_model.dart';
import 'package:flutter/cupertino.dart';

class SearchViewModel extends BaseViewModel {
  String _text = '1234';
  String get_text() => _text;

  final TextEditingController searchController = TextEditingController();
  bool _writting = false;
  bool get writting => _writting;
  final FocusNode searchFocusNode = FocusNode();

  void search() {
    final text = searchController.text;
    _text = text;
    notifyListeners();
    search2(text);
  }

  void search2(String text) {
    print(text);
  }

  FutureOr<void> init() async {
    searchFocusNode.addListener(() {
      _writting = searchFocusNode.hasFocus;
      notifyListeners();
    });
    //print('Search_viewmodel init');
    //changeStatus();
  }

  void api_call() async {
    try {
      ApiClient client = ApiClient();
      // check if the server is running

      final response = await client.getBlog(0);

      print(response);
      if (response != null) {
        //posts = response;
        notifyListeners();
      }
    } catch (e) {
      errorMessage = e.toString();
      notifyListeners();
    }
  }

  late String errorMessage;
}
