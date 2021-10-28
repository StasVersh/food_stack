import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_stack/app/core/services/recipe_service.dart';
import 'package:food_stack/app/core/services/user_service.dart';
import 'package:food_stack/app/data/model/recipe.dart';
import 'package:food_stack/app/data/model/user.dart';
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

  void onFavorite(index) {}

  @override
  void onInit() {
    updateRecipes();
    super.onInit();
  }

  Future<void> updateRecipes() {
    recipes.clear();
    return _recipeService
        .getFavoriteRecipe()
        .then((value) => recipes.value = value);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
