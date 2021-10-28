import 'package:flutter/material.dart';
import 'package:food_stack/app/core/services/recipe_service.dart';
import 'package:food_stack/app/core/services/user_service.dart';
import 'package:food_stack/app/data/model/ingredient_type.dart';
import 'package:food_stack/app/data/model/recipe.dart';
import 'package:food_stack/app/data/model/user.dart';
import 'package:get/get.dart';

class AddRecipeController extends GetxController {
  final RecipeService _recipeService;
  var title = '';
  late final body = <String>[''].obs;
  final imageSrc =
      'https://cdn.asiatatler.com/asiatatler/i/ph/2021/05/07105034-gettyimages-1257260385_cover_1280x764.jpg'
          .obs;
  var textEditingController = TextEditingController().obs;
  final List<String> ingredientsId = ['', ''];
  AddRecipeController(this._recipeService);

  void save() {
    var newRecipe = Recipe(title, '', ingredientsId, imageSrc.value, '');
    _recipeService.addRecipe(newRecipe);
    List<String> favorites = [newRecipe.id];
    Get.back<Recipe>(
      result: Recipe(title, '', ingredientsId, imageSrc.value, ''),
    );
  }

  void onEditingChanged() {}

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
