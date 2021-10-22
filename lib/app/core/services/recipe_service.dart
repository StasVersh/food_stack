import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_stack/app/core/values/database_constants.dart';
import 'package:food_stack/app/data/model/recipe.dart';

class RecipeService {
  late final FirebaseFirestore _firebaseDatabase;

  RecipeService(this._firebaseDatabase);

  Future addRecipe(Recipe recipe) async {
    var recipeData = await _firebaseDatabase
        .collection(DatabasePaths.recipePath)
        .add(recipe.toJson());
  }

  Future<List<Recipe>> getRecipes() async {
    var recipesData =
        await _firebaseDatabase.collection(DatabasePaths.recipePath).get();
    return recipesData.docs.map((e) => Recipe.fromDataset(e)).toList();
  }
}
