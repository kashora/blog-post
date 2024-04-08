// ignore_for_file: no_leading_underscores_for_local_identifier
import 'package:blog_poster/Util/view_model.dart';
import 'package:blog_poster/View/home_view.dart';
import 'package:blog_poster/View/profile_view.dart';
import 'package:blog_poster/View/search_view.dart';
import 'package:blog_poster/Viewmodel/home_viewmodel.dart';
import 'package:blog_poster/Viewmodel/profile_viewmodel.dart';
import 'package:blog_poster/Viewmodel/search_viewmode.dart';
import 'package:flutter/material.dart';

class MainViewModel extends ChangeNotifier {
  int index = 0;
  BuildContext? context;
  final List Pages = [HomePage(), SearchPage(), ProfilePage()];

  final List<BaseViewModel> viewModel = [
    HomeViewModel(),
    SearchViewModel(),
    ProfileViewModel()
  ];

  // PreferredSizeWidget getCurrentAppBar() => appBars[index];

  BaseViewModel getCurrentViewModel() {
    print('get_currentViewmode');
    return viewModel[index];
  }

  void setContext(BuildContext context) => this.context = context;

  Widget getCurrentPage() => Pages[index];

  void navigateBottomBar(int _index) {
    print('index');
    index = _index;
    //print(index);
    notifyListeners();
  }
}
