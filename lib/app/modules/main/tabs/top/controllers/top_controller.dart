import 'package:food_stack/app/core/services/recipe_service.dart';
import 'package:food_stack/app/core/services/user_service.dart';
import 'package:food_stack/app/data/model/recipe.dart';
import 'package:food_stack/app/routes/app_pages.dart';
import 'package:get/get.dart';

class TopController extends GetxController {
  final RecipeService _recipeService;
  final UserService _userService;
  late final recipes = <Recipe>[].obs;
  late final isFavorites = <bool>[].obs;

  TopController(this._recipeService, this._userService);

  void goToView(index) {
    Get.toNamed(
      Routes.RECIPEREVIEW,
      arguments: recipes[index],
    );
  }

  void favorites(int index) {
    if (isFavorites[index]) {
      _userService.removeFavorite(recipes[index]);
    } else {
      _userService.addFavorite(recipes[index]);
    }
    isFavorites[index] = !isFavorites[index];
  }

  Future<void> updateRecipes() {
    var isUpdateFavorites = <bool>[];
    var recipe = _recipeService.getTopRecipes().then(
      (recipeValue) {
        _userService.getUser().then(
          (value) {
            for (var recipeElement in recipes) {
              bool isFavorite = false;
              for (var element in value.favorites) {
                if (recipeElement.id == element) isFavorite = true;
              }
              isUpdateFavorites.add(isFavorite);
            }
            recipes.value = recipeValue;
            isFavorites.value = isUpdateFavorites;
          },
        );
      },
    );
    return recipe;
  }

  @override
  void onInit() {
    updateRecipes();
    super.onInit();
  }
}
