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
    updateRecipe(Recipe(
      recipe.title,
      recipe.body,
      recipe.ingredientsId,
      recipe.picture,
      recipeData.id,
    ));
  }

  Future updateRecipe(Recipe recipe) async {
    var recipeData = await _firebaseDatabase
        .collection(DatabasePaths.recipePath)
        .doc(recipe.id)
        .update(recipe.toJson());
  }

  Future<List<Recipe>> getTopRecipes() async {
    var recipesData =
        await _firebaseDatabase.collection(DatabasePaths.recipePath).get();
    var recipes = recipesData.docs.map((e) => Recipe.fromDataset(e)).toList();
    return recipes.reversed.toList();
  }

  Future<List<Recipe>> getMyRecipes() async {
    var recipesData =
        await _firebaseDatabase.collection(DatabasePaths.recipePath).get();
    var recipes = recipesData.docs.map((e) => Recipe.fromDataset(e)).toList();
    return recipes;
  }

  Future<List<Recipe>> getFavoriteRecipe() async {
    var userData = await _firebaseDatabase
        .collection(DatabasePaths.usersPath)
        .doc(DatabasePaths.userId)
        .get();
    List<dynamic> recipesId = userData.get('favorites');
    recipesId = recipesId.cast<String>();
    List<Recipe> recipes = [];
    for (var element in recipesId) {
      var recipeData = await _firebaseDatabase
          .collection(DatabasePaths.recipePath)
          .doc(element)
          .get();
      List<String> ingredientsId =
          List<String>.from(recipeData.get('ingredientsId'));
      recipes.add(
        Recipe(
          recipeData.get('title'),
          recipeData.get('body'),
          ingredientsId,
          recipeData.get('picture'),
          recipeData.get('id'),
        ),
      );
    }
    return recipes;
  }
}
