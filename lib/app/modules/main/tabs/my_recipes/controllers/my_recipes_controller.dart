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
      recipes.insert(0, newRecipe);
    }
  }

  void toRecipeReview(int index) {
    Get.toNamed(
      Routes.RECIPEREVIEW,
      arguments: recipes[index],
    );
  }

  Future<void> updateRecipes() {
    return _recipeService.getMyRecipes().then((value) => recipes.value = value);
  }

  @override
  void onInit() {
    updateRecipes();
    super.onInit();
  }
}
