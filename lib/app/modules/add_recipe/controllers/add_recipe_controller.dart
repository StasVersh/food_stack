import 'package:food_stack/app/core/services/recipe_service.dart';
import 'package:food_stack/app/data/model/ingredient_type.dart';
import 'package:food_stack/app/data/model/recipe.dart';
import 'package:get/get.dart';

class AddRecipeController extends GetxController {
  final RecipeService _recipeService;
  final String title = 'Роллото Боно';
  final String body = 'Что-то там сделать чтобы получились налесники';
  final isFavorite = false;
  final List<IngredientType> ingredients = [
    IngredientType.egg,
    IngredientType.flour
  ];
  final String url =
      'https://wpten.ru/category/kulinariya/p/633201/gallery/preview.jpg?url=shavuha-takuyu-shavuhu-vi-esche-ne-eli-skazhu-tak-ya-tozhe-ne-ela';
  AddRecipeController(this._recipeService);

  void save() {
    var newRecipe = Recipe(title, body, ingredients, url, isFavorite);
    _recipeService.addRecipe(newRecipe);
    Get.back<Recipe>(
      result: Recipe(title, body, ingredients, url, isFavorite),
    );
  }

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
