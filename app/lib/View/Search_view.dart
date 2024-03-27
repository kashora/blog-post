import 'package:blog_poster/Util/AppBar_view.dart';
import 'package:blog_poster/Util/Viewmodel.dart';
import 'package:blog_poster/Viewmodel/Search_viewmode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchBody extends StatefulWidget {
  SearchBody({super.key});

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  late final _search_viewmodel;

  @override
  void initState() {
    super.initState();
    _search_viewmodel = Provider.of<Viewmodel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    _search_viewmodel.setContext(context);
    return Scaffold(
        body: Consumer<Viewmodel>(builder: (context, viewModel, child) {
      print('test');
      return Row(children: [
        Center(child: Text(_search_viewmodel.get_text())),
        ElevatedButton(
          onPressed: () => _search_viewmodel.search('test'),
          child: Text('test'),
        )
      ]);
    }));
  }
}

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  SearchAppBar({super.key});
  @override
  State<SearchAppBar> createState() => SearchAppBarful();

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}

class SearchAppBarful extends State<SearchAppBar> {
  final TextEditingController _search_field_controller =
      TextEditingController();
  late final _search_viewmodel;
  final FocusNode _searchFocusNode = FocusNode();

  bool _writting = false;

  @override
  void initState() {
    super.initState();
    _search_viewmodel = Provider.of<Viewmodel>(context, listen: false);
    _searchFocusNode.addListener(() {
      setState(() {
        //check if the search field is in use and the user keyboard is on
        _writting = _searchFocusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //print('building');
    _search_viewmodel.setContext(context);
    return AppBar_container(Row(
      children: [
        Flexible(
            flex: 1,
            child: IconButton(
              icon: Icon(Icons.menu),
              color: Colors.white,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            )),
        Flexible(
          flex: 3,
          child: Container(
            //color: Colors.white,
            child: TextField(
              controller: _search_field_controller,
              focusNode: _searchFocusNode,
              onSubmitted: _search_viewmodel.search,
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
                  onPressed: () => _writting
                      ? _search_field_controller.clear()
                      : _search_viewmodel.search(_search_field_controller.text),
                  icon: Icon(_writting ? Icons.close : Icons.search),
                  color: Colors.white,
                ),
                /*border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10))
                    */
              ),
            ),
          ),
        ),
      ],
    ));
  }
}



/*
class SearchAppBar extends CustomizableAppBar {
  SearchAppBar({super.key})
      : super(child: Builder(builder: (context) {
          return Row(
            children: [
              Flexible(
                  flex: 1,
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    color: Colors.white,
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  )),
              Flexible(
                flex: 3,
                child: Container(
                  //color: Colors.white,
                  child: TextField(
                    onSubmitted: (value) {
                      print(value);
                    },
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.white),
                      contentPadding: EdgeInsets.all(10),
                      filled: true,
                      fillColor: Color.fromARGB(96, 209, 209, 209),
                      suffixIcon: IconButton(
                        onPressed: () => print('test'),
                        icon: Icon(Icons.search),
                        color: Colors.white,
                      ),
                      /*border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10))
                  */
                    ),
                  ),
                ),
              ),
            ],
          );
        }));
}
*/