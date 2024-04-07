import 'package:blog_poster/Util/AppBar_view.dart';
import 'package:blog_poster/Util/View.dart';
import 'package:blog_poster/Util/Viewmodel.dart';
import 'package:blog_poster/Viewmodel/Search_viewmode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchBody extends StatelessWidget {
  Widget build(BuildContext context) {
    return BaseView<SearchViewModel>(
        vmBuilder: (context) => SearchViewModel(), builder: _buildScreen);
  }

  Widget _buildScreen(BuildContext context, SearchViewModel vm) => Scaffold(
      appBar: CustomizableAppBar(
          child: Row(children: [
        Flexible(
            child: IconButton(
                icon: Icon(Icons.menu),
                color: Colors.white,
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                })),
        Flexible(
            flex: 3,
            child: Container(
                //color: Colors.white,
                child: TextField(
                    controller: vm.searchController,
                    focusNode: vm.searchFocusNode,
                    onSubmitted: vm.search2,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontStyle: FontStyle.italic),
                        contentPadding: EdgeInsets.all(10),
                        filled: true,
                        fillColor: Color.fromARGB(96, 209, 209, 209),
                        suffixIcon: IconButton(
                            onPressed: () => vm.writting
                                ? vm.searchController.clear()
                                : vm.search(),
                            icon:
                                Icon(vm.writting ? Icons.close : Icons.search),
                            color: Colors.white)))))
      ])),
      body: Row(children: [
        Center(child: Text(vm.get_text())),
        ElevatedButton(onPressed: () => vm.search2('test'), child: Text('test'))
      ]));
}
