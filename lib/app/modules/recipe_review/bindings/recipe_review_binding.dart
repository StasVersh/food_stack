import 'package:food_stack/app/modules/recipe_review/controllers/recipe_review_controller.dart';
import 'package:get/get.dart';

class RecipeReviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecipeReviewController>(
      () => RecipeReviewController(),
    );
  }
}
