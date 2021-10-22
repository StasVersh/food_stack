import 'package:firebase_core/firebase_core.dart';
import 'package:food_stack/app/core/services/recipe_service.dart';
import 'package:food_stack/app/data/model/recipe.dart';
import 'package:food_stack/app/modules/main/widgets/recipe_card.dart';
import 'package:food_stack/app/routes/app_pages.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final RecipeService _recipeService;
  late final recipes = <Recipe>[].obs;

  MainController(this._recipeService);

  void addRecipe() async {
    var newRecipe = await Get.toNamed(Routes.ADDRECIPE);
    if (newRecipe != null) {
      recipes.add(newRecipe);
    }
  }

  void toRecipeReview(int index) {
    print('sdgfklhj');
    Get.toNamed(
      Routes.RECIPEREVIEW,
      arguments: recipes[index],
    );
  }

  @override
  void onInit() {
    _recipeService.getRecipes().then((value) => recipes.value = value);
    recipes.value.sort();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
