import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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

  Future<List<Recipe>> getFavoriteRecipes() async {
    var recipesData =
        await _firebaseDatabase.collection(DatabasePaths.recipePath).get();
    var recipes = recipesData.docs.map((e) => Recipe.fromDataset(e)).toList();
    List<Recipe> favoriteRecipes = [];
    for (int i = 0; i < recipes.length; i++) {
      if (recipes[i].isFavorite) {
        favoriteRecipes.add(recipes[i]);
      }
    }
    return favoriteRecipes;
  }
}
