import 'package:food_stack/app/core/services/recipe_service.dart';
import 'package:food_stack/app/data/model/recipe.dart';
import 'package:food_stack/app/routes/app_pages.dart';
import 'package:get/get.dart';

class MyRecipesController extends GetxController {
  final RecipeService _recipeService;
  late final recipes = <Recipe>[].obs;

  MyRecipesController(this._recipeService);

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

  @override
  void onInit() {
    updateRecipes();
    super.onInit();
  }

  void updateRecipes() {
    recipes.clear();
    _recipeService.getRecipes().then((value) => recipes.value = value);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
