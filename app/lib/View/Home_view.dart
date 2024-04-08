// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:blog_poster/Model/blog_model.dart';
import 'package:blog_poster/Services/api_service.dart';
import 'package:blog_poster/Util/appBar_view.dart';
import 'package:blog_poster/Util/view.dart';
import 'package:blog_poster/Viewmodel/home_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:dio/dio.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        vmBuilder: (context) => HomeViewModel(), builder: _buildScreen);
  }

  Widget _buildScreen(BuildContext context, HomeViewModel vm) => Scaffold(
      appBar: CustomizableAppBar(
          child: Row(
        children: [
          Flexible(
              flex: 1,
              child: IconButton(
                icon: Icon(Icons.menu),
                color: Colors.white,
                onPressed: () {
                  print('open drawer');
                  Scaffold.of(context).openDrawer();
                },
              )),
          Flexible(
              flex: 3,
              child: Text(
                "Home",
                style: TextStyle(
                    color: Colors.white,
                    //fontStyle: FontStyle.italic,
                    fontSize: 30,
                    fontWeight: FontWeight.w300),
              )),
        ],
      )),
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
        future: apiService.getBlog(0),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final BlogModel blogs = snapshot.data!;
            final List<BlogModel> blogList = [blogs];
            return _blogs(blogList);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget _blogs(List<BlogModel> blogs) => ListView.builder(
      itemCount: blogs.length,
      itemBuilder: (context, index) => _blog(blogs[index]));

  Widget _blog(BlogModel blog) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  blog.title,
                  style: TextStyle(fontSize: 20),
                )),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0, 4, 0),
                  child: Flexible(
                      flex: 1,
                      child: Column(
                        children: [
                          CircleAvatar(
                              backgroundImage: blog.owner.userImage.image),
                          Text(blog.owner.name)
                        ],
                      )),
                ),
                Flexible(
                  flex: 3,
                  child: Column(children: [
                    Container(
                        width: 330,
                        height: 50,
                        child: Text(
                          blog.content,
                          softWrap: true,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12),
                        )),
                    SizedBox(height: 6),
                    Container(
                        height: 25,
                        width: 330,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: blog.keyWords.length,
                            itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.fromLTRB(0, 1, 7, 0),
                                child: InkWell(
                                    borderRadius: BorderRadius.circular(10),
                                    onTap: () {
                                      print('test');
                                    },
                                    child: Ink(
                                      padding:
                                          const EdgeInsets.fromLTRB(3, 1, 3, 1),
                                      child: Text('test'),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color.fromARGB(
                                              181, 240, 233, 169)),
                                    )))))
                  ]),
                ),
              ],
            ),
          ],
        ),
      );
}
