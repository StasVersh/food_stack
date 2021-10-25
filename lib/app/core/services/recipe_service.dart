import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_stack/app/core/values/database_constants.dart';
import 'package:food_stack/app/data/model/recipe.dart';
import 'package:food_stack/app/data/model/user.dart';

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
      recipe.ingredients,
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
    List<Recipe> favoriteRecipes = [];
    var usersData = await _firebaseDatabase
        .collection(DatabasePaths.usersPath)
        .doc('5Sq0Ni0MQQOUG0T7K92k')
        .get();
    List<String> favoriteRecipesId = usersData.get('favorites');
    for (int i = 0; i < favoriteRecipesId.length; i++) {
      var recipeData = await _firebaseDatabase
          .collection(DatabasePaths.usersPath)
          .doc(favoriteRecipesId[i])
          .get();
      favoriteRecipes[i] = Recipe(
        recipeData.get('title'),
        recipeData.get('body'),
        recipeData.get('ingredients'),
        recipeData.get('picture'),
        recipeData.get('id'),
      );
    }
    return favoriteRecipes;
  }
}
