import 'package:flutter/material.dart';
import 'package:food_stack/app/core/values/colors.dart';
import 'package:food_stack/app/core/values/locale_keys.dart';
import 'package:food_stack/app/modules/main/tabs/top/controllers/top_controller.dart';
import 'package:food_stack/app/modules/main/tabs/top/widgets/recipe_card.dart';
import 'package:get/get.dart';

class TopView extends GetView<TopController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appCherry,
        title: Text(LocaleKeys.top100.tr),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: controller.updateRecipes,
            icon: Icon(
              Icons.refresh,
            ),
          )
        ],
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
                      child: RecipeCard(
                        color: controller.favoritesColor,
                        recipe: controller.recipes[index],
                        index: index + 1,
                        onPress: () {},
                        onFavorites: () => controller.favorites(index),
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
    );
  }
}
