// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
      json['title'] as String,
      (json['body'] as List<dynamic>).map((e) => e as String).toList(),
      (json['ingredientsId'] as List<dynamic>).map((e) => e as String).toList(),
      json['picture'] as String,
      json['id'] as String,
      json['creatorId'] as String,
      json['createDate'] as String,
    );

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'creatorId': instance.creatorId,
      'ingredientsId': instance.ingredientsId,
      'picture': instance.picture,
      'id': instance.id,
      'createDate': instance.createDate,
    };
