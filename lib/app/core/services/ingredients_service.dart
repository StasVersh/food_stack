import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_stack/app/core/values/database_constants.dart';
import 'package:food_stack/app/data/model/ingredient.dart';

class IngredientsService {
  final FirebaseFirestore _firebaseFirestore;

  IngredientsService(this._firebaseFirestore);

  Future addIngredient(Ingredient ingredient) async {
    var ingredientData = await _firebaseFirestore
        .collection(DatabasePaths.ingredientsPath)
        .add(ingredient.toJson());
    updateIngredient(Ingredient(
      ingredientData.id,
      ingredient.recipesId,
      ingredient.name,
    ));
  }

  Future updateIngredient(Ingredient ingredient) async {
    var ingredientData = await _firebaseFirestore
        .collection(DatabasePaths.ingredientsPath)
        .doc(ingredient.id)
        .update(ingredient.toJson());
  }

  Future<List<Ingredient>> getIngredients() async {
    var ingredientData = await _firebaseFirestore
        .collection(DatabasePaths.ingredientsPath)
        .get();
    var ingredients =
        ingredientData.docs.map((e) => Ingredient.fromDataset(e)).toList();
    return ingredients;
  }
}
