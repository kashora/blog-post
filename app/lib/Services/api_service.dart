import 'dart:convert';
import 'dart:math';

import 'package:blog_poster/Model/blog_model.dart';
import 'package:blog_poster/Model/user_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: 'http://192.168.1.114:5000')
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('/user')
  Future<UserModel> getUser(@Query('id') int UserId);

  @GET('/blog')
  Future<BlogModel> getBlog(@Query('id') int BlogId);

  @GET('/blogs')
  Future<List<BlogModel>> getBlogs();
}
