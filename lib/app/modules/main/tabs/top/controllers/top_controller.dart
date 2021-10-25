import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_stack/app/core/services/recipe_service.dart';
import 'package:food_stack/app/core/values/colors.dart';
import 'package:food_stack/app/data/model/recipe.dart';
import 'package:food_stack/app/routes/app_pages.dart';
import 'package:get/get.dart';

class TopController extends GetxController {
  final RecipeService _recipeService;
  late final recipes = <Recipe>[].obs;

  TopController(this._recipeService);

  void addRecipe() async {
    var newRecipe = await Get.toNamed(Routes.ADDRECIPE);
    if (newRecipe != null) {
      recipes.add(newRecipe);
    }
  }

  void toRecipeReview(int index) {
    Get.toNamed(
      Routes.RECIPEREVIEW,
      arguments: recipes[index],
    );
  }

  void favorites(int index) {}

  @override
  void onInit() {
    updateRecipes();
    super.onInit();
  }

  Future<void> updateRecipes() {
    recipes.clear();
    return _recipeService
        .getTopRecipes()
        .then((value) => recipes.value = value);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
