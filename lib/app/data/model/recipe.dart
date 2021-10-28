import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_stack/app/data/model/ingredient_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recipe.g.dart';

@JsonSerializable()
class Recipe {
  //flutter pub run build_runner build
  final String title;
  final String body;
  final List<String> ingredientsId;
  final String picture;
  final String id;
  final DateTime createDate = DateTime.now();

  Recipe(this.title, this.body, this.ingredientsId, this.picture, this.id);

  factory Recipe.fromDataset(QueryDocumentSnapshot dataSnapshot) {
    return Recipe.fromJson(
        (dataSnapshot.data() as Map<dynamic, dynamic>).cast<String, dynamic>());
  }

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
