import 'package:blog_poster/Model/blog_model.dart';
import 'package:blog_poster/Util/appBar_view.dart';
import 'package:blog_poster/Util/view.dart';
import 'package:blog_poster/Viewmodel/blogViewer_viewmodel.dart';
import 'package:blog_poster/Viewmodel/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BlogViewerPage extends StatelessWidget {
  const BlogViewerPage({super.key, required this.blog});
  final BlogModel blog;

  Widget build(BuildContext context) {
    return BaseView<BlogViewerViewModel>(
        vmBuilder: (context) => BlogViewerViewModel(), builder: _buildScreen);
  }

  Widget _buildScreen(BuildContext context, BlogViewerViewModel vm) => SafeArea(
      child: Scaffold(
          body: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool isScrolled) =>
                  [SliverAppBar(title: Text(blog.title), 
                  iconTheme: IconThemeData(color: Colors.white),
                  
                  )],
              body: Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                children: [
                  blogData(),
                  Divider(color: Colors.black),
                  writerData()
                ],
              ))))));
  Widget blogData() => Text(blog.content);

  Widget writerData() => Container(child: Text(blog.owner.name));
}
