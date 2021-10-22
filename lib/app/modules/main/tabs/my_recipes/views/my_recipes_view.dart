import 'package:flutter/material.dart';
import 'package:food_stack/app/core/values/colors.dart';
import 'package:food_stack/app/core/values/locale_keys.dart';
import 'package:food_stack/app/modules/main/tabs/my_recipes/controllers/my_recipes_controller.dart';
import 'package:food_stack/app/modules/main/tabs/my_recipes/widgets/my_recipe_card.dart';
import 'package:get/get.dart';

class MyRecipesView extends GetView<MyRecipesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appCherry,
        title: Text(LocaleKeys.myRecipes.tr),
        centerTitle: true,
      ),
      body: Obx(
        () {
          return controller.recipes.isNotEmpty
              ? ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                      ),
                      child: MyRecipeCard(
                        recipe: controller.recipes[index],
                        index: index + 1456,
                        onPress: () {
                          controller.toRecipeReview(index);
                        },
                      ),
                    );
                  },
                  itemCount: controller.recipes.length,
                )
              : const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.appCherry,
                    strokeWidth: 6,
                  ),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
