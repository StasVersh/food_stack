import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recipe.g.dart';

@JsonSerializable()
class Recipe {
  //flutter pub run build_runner build
  final String title;
  final List<String> body;
  final String creatorId;
  final List<String> ingredientsId;
  final String picture;
  final String id;
  final String createDate;

  Recipe(this.title, this.body, this.ingredientsId, this.picture, this.id,
      this.creatorId, this.createDate);

  factory Recipe.fromDataset(QueryDocumentSnapshot dataSnapshot) {
    return Recipe.fromJson(
        (dataSnapshot.data() as Map<dynamic, dynamic>).cast<String, dynamic>());
  }

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);

  String ingredientsToString() {
    return '';
  }
}
