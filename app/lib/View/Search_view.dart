import 'package:blog_poster/Util/appBar_view.dart';
import 'package:blog_poster/Util/view.dart';
import 'package:blog_poster/Viewmodel/search_viewmode.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
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
            child: Padding(
                padding: EdgeInsets.all(6),
                //color: Colors.white,
                child: TextField(
                    controller: vm.searchController,
                    focusNode: vm.searchFocusNode,
                    onSubmitted: vm.search2,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: "Search",
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 204, 204, 204),
                            fontSize: 20,
                            fontStyle: FontStyle.italic),
                        contentPadding: EdgeInsets.all(8),
                        filled: true,
                        fillColor: Color.fromARGB(64, 117, 113, 153),
                        suffixIcon: IconButton(
                            onPressed: () => vm.writting
                                ? vm.searchController.clear()
                                : vm.search(),
                            icon:
                                Icon(vm.writting ? Icons.close : Icons.search),
                            color: Colors.white)))))
      ])),
      body: vm.isInitialized
          ? Row(children: [
              Center(child: Text(vm.get_text())),
              ElevatedButton(
                  onPressed: () => print('button pressed'), child: Text('test'))
            ])
          : Container(
              color: Colors.white,
              child: Center(child: CircularProgressIndicator())));
}
