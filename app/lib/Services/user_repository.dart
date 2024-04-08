import 'dart:io';

import 'package:blog_poster/Model/user_model.dart';

class UserRepo {
  final String _baseUrl = '127.0.0.1';

  Future<dynamic> getUser(int id) async {
    dynamic responseJson;
    try {
      //final response = await http.get();
    } on SocketException {}
    return responseJson;
  }
}
