import 'package:flutter/material.dart';
import 'package:food_stack/app/core/services/ingredients_service.dart';
import 'package:food_stack/app/core/services/recipe_service.dart';
import 'package:food_stack/app/data/model/ingredient.dart';
import 'package:food_stack/app/data/model/recipe.dart';
import 'package:get/get.dart';

class AddRecipeController extends GetxController {
  final RecipeService _recipeService;
  final IngredientsService _ingredientsService;
  var title = '';
  late final body = <String>[''].obs;
  final imageSrc =
      'https://cdn.asiatatler.com/asiatatler/i/ph/2021/05/07105034-gettyimages-1257260385_cover_1280x764.jpg'
          .obs;
  var textEditingController = TextEditingController().obs;
  final ingredients = <Ingredient>[].obs;
  var ingredientsId = <String>[];
  AddRecipeController(this._recipeService, this._ingredientsService);

  void save() {
    var newRecipe =
        Recipe(title, body.value[0], ingredientsId, imageSrc.value, '');
    _recipeService.addRecipe(newRecipe);
    List<String> favorites = [newRecipe.id];
    Get.back<Recipe>(
      result: Recipe(title, body.value[0], ingredientsId, imageSrc.value, ''),
    );
  }

  void createIngredient(BuildContext context) async {
    TextEditingController controller = TextEditingController();
    var dialog = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Создание рецепта'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration.collapsed(
              hintText: 'Название ингридиента...',
            ),
          ),
          actions: [
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                List<String> recipeId = [];
                _ingredientsService
                    .addIngredient(Ingredient('', recipeId, controller.text));
                ingredients.add(Ingredient('', recipeId, controller.text));
                Get.back();
              },
            ),
            TextButton(
              child: Text('Back'),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }

  void onEditingChanged() {}

  @override
  void onInit() {
    updateIngredients();
    super.onInit();
  }

  void updateIngredients() {
    _ingredientsService
        .getIngredients()
        .then((value) => ingredients.value = value);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
