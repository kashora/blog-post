import 'package:blog_poster/Model/blog_model.dart';
import 'package:blog_poster/Model/user_model.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: '127.0.0.1')
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('user')
  Future<UserModel> getUser(int UserId);

  @GET('blog')
  Future<BlogModel> getBlog(int BlogId);

  @GET('blogs')
  Future<List<BlogModel>> getBlogs();
}
