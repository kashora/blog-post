// ignore_for_file: prefer_const_constructors

import 'package:blog_poster/Model/blog_model.dart';
import 'package:blog_poster/Services/api_service.dart';
import 'package:blog_poster/Util/appBar_view.dart';
import 'package:blog_poster/Util/view.dart';
import 'package:blog_poster/View/blogViewer_view.dart';
import 'package:blog_poster/Viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:dio/dio.dart';

class HomePage extends StatelessWidget {
  late List<BlogModel> blogsList = [];
  ConnectionState connectionStatus = ConnectionState.none;

  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        vmBuilder: (context) => HomeViewModel(), builder: _buildScreen);
  }

  Widget _buildScreen(BuildContext context, HomeViewModel vm) => Scaffold(
      appBar: CustomizableAppBar(
          child: Row(children: [
        Flexible(
            flex: 1,
            child: IconButton(
                icon: Icon(Icons.menu),
                color: Colors.white,
                onPressed: () {
                  print('open drawer');
                  Scaffold.of(context).openDrawer();
                })),
        Flexible(
            flex: 3,
            child: Text("Home",
                style: TextStyle(
                    color: Colors.white,
                    //fontStyle: FontStyle.italic,
                    fontSize: 30,
                    fontWeight: FontWeight.w300)))
      ])),
      body: vm.isInitialized
          ? _body(vm) //Center(child: Text('test'))
          : Container(
              color: Colors.white,
              child: Center(child: CircularProgressIndicator())));

  FutureBuilder _body(HomeViewModel vm) {
    final apiService =
        ApiService(Dio(BaseOptions(contentType: "application/json")));
    //ApiService(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder(
        future: vm.initBlogs(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              {
                return Center(child: CircularProgressIndicator());
              }
            case ConnectionState.done:
              {
                return RefreshIndicator(
                    child: _blogs(vm.getBlogs()), onRefresh: vm.refreshBlogs);
              }
          }
        });
  }

  Widget _blogs(List<BlogModel> blogs) => Padding(
      padding: const EdgeInsets.fromLTRB(0, 3.0, 0, 0),
      child: ListView.builder(
          itemCount: blogs.length,
          itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            BlogViewerPage(blog: blogs[index])));
              },
              child: _blog(blogs[index]))));

  Widget _blog(BlogModel blog) => Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
      child: Column(children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(blog.title, style: TextStyle(fontSize: 20))),
        Row(children: [
          Flexible(
              flex: 1,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0, 4, 0),
                  child: Column(children: [
                    CircleAvatar(
                        radius: 20,
                        backgroundImage: blog.owner.userImage.image),
                    Text(blog.owner.name)
                  ]))),
          Flexible(
              flex: 3,
              child: Column(children: [
                Container(
                    width: 330,
                    height: 50,
                    child: Text(blog.content,
                        softWrap: true,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12))),
                SizedBox(height: 6),
                Container(
                    height: 25,
                    width: 330,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: blog.keyWords.length,
                        itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.fromLTRB(0, 1, 7, 0),
                            child: Material(
                                child: InkWell(
                                    // if the inkwell outside the container, the inkwell will not work

                                    borderRadius: BorderRadius.circular(10),
                                    onTap: () {
                                      print('test');
                                    },
                                    child: Ink(
                                        padding: const EdgeInsets.fromLTRB(
                                            3, 1, 3, 1),
                                        child: Text(blog.keyWords[index]),
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color.fromARGB(
                                                181, 240, 233, 169))))))))
              ]))
        ]),
        Divider(color: Colors.black)
      ]));
}
