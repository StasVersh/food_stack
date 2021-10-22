import 'package:flutter/material.dart';
import 'package:food_stack/app/core/values/colors.dart';
import 'package:food_stack/app/modules/main/widgets/recipe_card.dart';
import 'package:get/get.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appCherry,
        title: Text('FoodStack'),
        centerTitle: true,
      ),
      body: Obx(() {
        return controller.recipes.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return RecipeCard(
                      recipe: controller.recipes[index],
                      index: index + 1,
                      onPress: () {
                        controller.toRecipeReview(index);
                      },
                    );
                  },
                  itemCount: controller.recipes.length,
                ),
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: AppColors.appCherry,
                  strokeWidth: 6,
                ),
              );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.addRecipe,
        child: Icon(Icons.add),
      ),
    );
  }
}
