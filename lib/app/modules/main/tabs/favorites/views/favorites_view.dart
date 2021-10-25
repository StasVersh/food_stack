import 'package:flutter/material.dart';
import 'package:food_stack/app/core/values/colors.dart';
import 'package:food_stack/app/core/values/locale_keys.dart';
import 'package:food_stack/app/modules/main/tabs/favorites/controllers/favorites_controller.dart';
import 'package:food_stack/app/modules/main/tabs/favorites/widgets/favorites_recipe_card.dart';
import 'package:food_stack/app/modules/main/tabs/top/widgets/recipe_card.dart';
import 'package:get/get.dart';

class FavoritesView extends GetView<FavoritesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appCherry,
        title: Text(LocaleKeys.favorite.tr),
        centerTitle: true,
      ),
      body: Obx(
        () {
          return controller.recipes.isNotEmpty
              ? RefreshIndicator(
                  color: AppColors.appCherry,
                  onRefresh: controller.updateRecipes,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          right: 8.0,
                        ),
                        child: FavoritesRecipeCard(
                          recipe: controller.recipes[index],
                          index: index + 1,
                          onPress: () {},
                        ),
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
        },
      ),
    );
  }
}
