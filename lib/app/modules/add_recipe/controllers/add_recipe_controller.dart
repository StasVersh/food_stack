import 'package:food_stack/app/core/services/recipe_service.dart';
import 'package:food_stack/app/core/services/user_service.dart';
import 'package:food_stack/app/data/model/ingredient_type.dart';
import 'package:food_stack/app/data/model/recipe.dart';
import 'package:food_stack/app/data/model/user.dart';
import 'package:get/get.dart';

class AddRecipeController extends GetxController {
  final RecipeService _recipeService;
  final UserService _userService;
  final String title = 'Роллото Боно';
  final String body = 'Что-то там сделать чтобы получились налесники';
  final isFavorite = false;
  final List<IngredientType> ingredients = [
    IngredientType.egg,
    IngredientType.flour
  ];
  final String url =
      'https://wpten.ru/category/kulinariya/p/633201/gallery/preview.jpg?url=shavuha-takuyu-shavuhu-vi-esche-ne-eli-skazhu-tak-ya-tozhe-ne-ela';
  AddRecipeController(this._recipeService, this._userService);

  void save() {
    var newRecipe = Recipe(title, body, ingredients, url, '');
    _recipeService.addRecipe(newRecipe);
    List<String> favorites = [newRecipe.id];
    _userService.addUser(User('', 'Admin', 'Admin', favorites));
    Get.back<Recipe>(
      result: Recipe(title, body, ingredients, url, ''),
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
