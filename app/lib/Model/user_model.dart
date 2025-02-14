import 'package:blog_poster/Util/Image_util.dart';
import 'package:flutter/widgets.dart';

class UserModel {
  int id;
  String name;
  String email;
  Image userImage; // ! Todo: add the image
  //String? imageLink;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.userImage});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    var imageLink = json['imageLink'];
    //print(imageLink);
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],

      userImage: imageLink != null
          ? Image.network(imageLink)
          : Image.asset('assets/images/blank_avatar.jpg'),
      //userImage: Image.asset('assets/images/fixation_cross.jpeg'),
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
      };
}
