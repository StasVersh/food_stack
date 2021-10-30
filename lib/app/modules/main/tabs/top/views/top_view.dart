import 'package:flutter/material.dart';
import 'package:food_stack/app/core/values/colors.dart';
import 'package:food_stack/app/core/values/locale_keys.dart';
import 'package:food_stack/app/global_widgets/recipe_card.dart';
import 'package:food_stack/app/modules/main/tabs/top/controllers/top_controller.dart';
import 'package:get/get.dart';

class TopView extends GetView<TopController> {
  const TopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appCherry,
        title: Text(LocaleKeys.top100.tr),
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
                        child: RecipeCard(
                          recipe: controller.recipes[index],
                          leading: SizedBox(
                            width: 50,
                            height: 50,
                            child: Center(
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          trailing: SizedBox(
                            height: 40,
                            width: 40,
                            child: Center(
                              child: IconButton(
                                splashRadius: 20,
                                onPressed: () => controller.favorites(index),
                                icon: const Icon(Icons.star_border),
                                splashColor: Colors.black12,
                              ),
                            ),
                          ),
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
