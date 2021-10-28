import 'package:food_stack/app/modules/add_recipe/controllers/add_recipe_controller.dart';
import 'package:food_stack/app/modules/main/controllers/main_controller.dart';
import 'package:get/get.dart';

class AddRecipeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddRecipeController>(
      () => AddRecipeController(Get.find()),
    );
  }
}
