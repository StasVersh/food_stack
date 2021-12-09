import 'package:flutter/material.dart';
import 'package:food_stack/app/core/values/colors.dart';
import 'package:food_stack/app/core/values/locale_keys.dart';
import 'package:food_stack/app/modules/main/tabs/favorites/controllers/favorites_controller.dart';
import 'package:food_stack/app/global_widgets/recipe_card.dart';
import 'package:get/get.dart';

class FavoritesView extends GetView<FavoritesController> {
  const FavoritesView({Key? key}) : super(key: key);

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
          return RefreshIndicator(
              color: AppColors.appCherry,
              onRefresh: controller.updateRecipes,
              child: controller.recipes.isNotEmpty
                  ? ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            right: 8.0,
                          ),
                          child: GestureDetector(
                            onTap: () {},
                            child: RecipeCard(
                              recipe: controller.recipes[index],
                              trailing: SizedBox(
                                height: 40,
                                width: 40,
                                child: Center(
                                  child: IconButton(
                                    splashRadius: 20,
                                    onPressed: () =>
                                        controller.onFavorite(index, context),
                                    icon: const Icon(
                                      Icons.star,
                                      color: AppColors.appCherry,
                                    ),
                                    splashColor: Colors.black12,
                                  ),
                                ),
                              ),
                            ),
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
                    ));
        },
      ),
    );
  }
}
