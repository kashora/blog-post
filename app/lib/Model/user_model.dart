import 'package:blog_poster/Util/Image_util.dart';
import 'package:flutter/widgets.dart';

class UserModel {
  int? id;
  String? name;
  String? email;
  Image userImage; // ! Todo: add the image
  //String? imageLink;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.userImage});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      //imageLink: json['userImage']
      userImage: imageFromBase64String(json['image']),
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
      };
}
