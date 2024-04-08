import 'package:blog_poster/Model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

//part 'blog_model.g.dart';

@JsonSerializable()
class BlogModel {
  int id;
  String content;
  UserModel owner;
  String title;
  List<String> keyWords;

  BlogModel(
      {required this.id,
      required this.title,
      required this.content,
      required this.owner,
      required this.keyWords});

/*
  factory BlogModel.fromJson(Map<String, dynamic> json) => _$BlogModelFromJson(json);
  Map<String, dynamic> toJson() => _$BlogModelToJson(this);
*/
  factory BlogModel.fromJson(Map<String, dynamic> json) {
    List<String> keyWords = [];
    for (var i = 0; i < json['keyWords'].length; i++) {
      keyWords.add(json['keyWords'][i]);
    }
    return BlogModel(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      owner: UserModel.fromJson(json['owner']),
      keyWords: keyWords,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'content': content,
        'owner': owner.toJson(),
        'title': title,
        'key_words': keyWords
      };
}
