import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ingredient.g.dart';

@JsonSerializable()
class Ingredient {
  //flutter pub run build_runner build
  final String id;
  final String name;
  final List<String> recipesId;

  Ingredient(this.id, this.recipesId, this.name);

  factory Ingredient.fromDataset(QueryDocumentSnapshot dataSnapshot) {
    return Ingredient.fromJson(
        (dataSnapshot.data() as Map<dynamic, dynamic>).cast<String, dynamic>());
  }

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}
