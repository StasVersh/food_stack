import 'package:flutter/material.dart';
import 'package:food_stack/app/core/services/recipe_service.dart';
import 'package:food_stack/app/core/services/user_service.dart';
import 'package:food_stack/app/core/values/colors.dart';
import 'package:food_stack/app/core/values/locale_keys.dart';
import 'package:food_stack/app/data/model/recipe.dart';
import 'package:food_stack/app/routes/app_pages.dart';
import 'package:get/get.dart';

class FavoritesController extends GetxController {
  final RecipeService _recipeService;
  final UserService _userService;
  late final recipes = <Recipe>[].obs;

  FavoritesController(this._recipeService, this._userService);

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

  void onFavorite(index, context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.appCherry,
        content: ListTile(
          title: Text(
            LocaleKeys.favoriteWarning.tr,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          leading: const Icon(
            Icons.warning,
            color: Colors.white,
          ),
          trailing: TextButton(
            onPressed: () {
              _userService.removeFavorite(recipes[index]);
              recipes.removeAt(index);
              Scaffold.of(context).removeCurrentSnackBar();
            },
            child: Text(LocaleKeys.yes.tr),
          ),
        ),
      ),
    );
  }

  @override
  void onInit() {
    updateRecipes();
    super.onInit();
  }

  Future<void> updateRecipes() {
    return _recipeService
        .getFavoriteRecipe()
        .then((value) => recipes.value = value);
  }

  @override
  void onReady() {
    updateRecipes();
    super.onReady();
  }

  @override
  void onClose() {}
}
