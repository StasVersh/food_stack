import 'package:food_stack/app/modules/add_recipe/bindings/add_recipe_binding.dart';
import 'package:food_stack/app/modules/add_recipe/views/add_recipe_view.dart';
import 'package:food_stack/app/modules/main/bindings/main_binding.dart';
import 'package:food_stack/app/modules/main/views/main_view.dart';
import 'package:food_stack/app/modules/recipe_review/bindings/recipe_review_binding.dart';
import 'package:food_stack/app/modules/recipe_review/controllers/recipe_review_controller.dart';
import 'package:food_stack/app/modules/recipe_review/views/recipe_review_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage<MainView>(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage<AddRecipeView>(
      name: _Paths.ADDRECIPE,
      page: () => AddRecipeView(),
      binding: AddRecipeBinding(),
    ),
    GetPage<RecipeReviewView>(
      name: _Paths.RECIPEREVIEW,
      page: () => RecipeReviewView(),
      binding: RecipeReviewBinding(),
    ),
  ];
}
