import 'dart:async';

import 'package:blog_poster/Model/blog_model.dart';
import 'package:blog_poster/Services/api_service.dart';
import 'package:blog_poster/Util/view_model.dart';
import 'package:dio/dio.dart';

class HomeViewModel extends BaseViewModel {
  String _text = '';
  String get text => _text;

  late ApiService apiService;
  late List<BlogModel> _blogs;

  List<BlogModel> getBlogs() => _blogs;

  void search(String text) {
    _text = text;
    notifyListeners();

    print(text);
  }

  FutureOr<void> init() async {
    _blogs = [];
    apiService = ApiService(Dio(BaseOptions(contentType: "application/json")));
    //print('Search_viewmodel init');
    //changeStatus();
  }

  Future<void> initBlogs() async {
    final blogs =
        await apiService.getBlogs().timeout(const Duration(seconds: 4 ));
    _blogs = blogs;
  }

  Future<void> refreshBlogs() async {
    final blogs = await apiService.getBlogs();
    notifyListeners();
  }
}
