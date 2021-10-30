import 'package:food_stack/app/core/services/recipe_service.dart';
import 'package:food_stack/app/core/services/user_service.dart';
import 'package:food_stack/app/data/model/recipe.dart';
import 'package:food_stack/app/routes/app_pages.dart';
import 'package:get/get.dart';

class TopController extends GetxController {
  final RecipeService _recipeService;
  final UserService _userService;
  late final recipes = <Recipe>[].obs;

  TopController(this._recipeService, this._userService);

  void addRecipe() async {
    var newRecipe = await Get.toNamed(Routes.ADDRECIPE);
    if (newRecipe != null) {
      recipes.add(newRecipe);
    }
  }

  void favorites(int index) {
    _userService.addFavorite(recipes[index]);
  }

  @override
  void onInit() {
    updateRecipes();
    super.onInit();
  }

  Future<void> updateRecipes() {
    return _recipeService
        .getTopRecipes()
        .then((value) => recipes.value = value);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
