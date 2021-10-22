// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
      json['title'] as String,
      json['body'] as String,
      (json['ingredients'] as List<dynamic>)
          .map((e) => _$enumDecode(_$IngredientTypeEnumMap, e))
          .toList(),
      json['picture'] as String,
    );

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'ingredients':
          instance.ingredients.map((e) => _$IngredientTypeEnumMap[e]).toList(),
      'picture': instance.picture,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$IngredientTypeEnumMap = {
  IngredientType.egg: 'egg',
  IngredientType.flour: 'flour',
  IngredientType.sugar: 'sugar',
  IngredientType.salt: 'salt',
  IngredientType.pepper: 'pepper',
};
