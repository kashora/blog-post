// ignore_for_file: no_leading_underscores_for_local_identifier
import 'package:blog_poster/Util/AppBar_view.dart';
import 'package:blog_poster/Util/Viewmodel.dart';
import 'package:blog_poster/View/Home_view.dart';
import 'package:blog_poster/View/Profile_view.dart';
import 'package:blog_poster/View/Search_view.dart';
import 'package:blog_poster/Viewmodel/Home_viewmodel.dart';
import 'package:blog_poster/Viewmodel/Profile_viewmodel.dart';
import 'package:blog_poster/Viewmodel/Search_viewmode.dart';
import 'package:flutter/material.dart';

class MainViewModel extends ChangeNotifier {
  int index = 0;
  BuildContext? context;
  final List bodies = [HomeBody(), SearchBody(), ProfileBody()];
  /*final List<PreferredSizeWidget> appBars = [
    HomeAppBar(),
    SearchAppBar(),
    ProfileAppBar()
  ];
*/
  final List<BaseViewModel> viewModel = [
    Home_viewmodel(),
    SearchViewModel(),
    Profile_viewmodel()
  ];

  // PreferredSizeWidget getCurrentAppBar() => appBars[index];

  BaseViewModel getCurrentViewModel() {
    print('get_currentViewmode');
    return viewModel[index];
  }

  void setContext(BuildContext context) => this.context = context;

  Widget getCurrentBody() => bodies[index];

  void navigateBottomBar(int _index) {
    print('index');
    index = _index;
    //print(index);
    notifyListeners();
  }
}
