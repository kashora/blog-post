// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ApiService implements ApiService {
  _ApiService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://192.168.1.114:5000';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<UserModel> getUser(UserId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': UserId};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<UserModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/user',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BlogModel> getBlog(BlogId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': BlogId};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<BlogModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/blog',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BlogModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<BlogModel>> getBlogs() async {
    print('call blogs');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    List<BlogModel> blogList = [tempBlog()];

    try {
      final _result = await _dio
          .fetch<List<dynamic>>(_setStreamType<List<BlogModel>>(Options(
        method: 'GET',
        headers: _headers,
        extra: _extra,
      )
              .compose(
                _dio.options,
                '/blogs',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
      var value = _result.data!;
      blogList = [];
      for (var i = 0; i < value.length; i++) {
        blogList.add(BlogModel.fromJson(value[i]));
      }
    } catch (e) {
      print(e);
    }
    //print('test');

    return blogList;
  }

  BlogModel tempBlog() {
    return BlogModel(
        id: 1,
        title: 'test',
        content: 'test',
        owner: UserModel(
            id: 1,
            name: 'test',
            email: 'test',
            userImage: Image.asset('assets/images/fixation_cross.jpeg')),
        keyWords: ['test']);
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
