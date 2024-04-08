// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogModel _$BlogModelFromJson(Map<String, dynamic> json) => BlogModel(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      owner: UserModel.fromJson(json['owner'] as Map<String, dynamic>),
      keyWords:
          (json['keyWords'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BlogModelToJson(BlogModel instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'owner': instance.owner,
      'title': instance.title,
      'keyWords': instance.keyWords,
    };
