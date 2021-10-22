import 'package:food_stack/app/core/services/recipe_service.dart';
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

  @override
  void onInit() {
    _recipeService.getRecipes().then((value) => recipes.value = value);
    super.onInit();
  }

  @override
  void onReady() {
    recipes.value = recipes.value.reversed.toList();
    print('SDGzdfhDFH' + recipes.value.toString());
    super.onReady();
  }

  @override
  void onClose() {}
}
