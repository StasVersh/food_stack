import 'package:flutter/material.dart';
import 'package:food_stack/app/core/values/colors.dart';
import 'package:food_stack/app/core/values/locale_keys.dart';
import 'package:food_stack/app/global_widgets/recipe_card.dart';
import 'package:food_stack/app/modules/main/tabs/my_recipes/controllers/my_recipes_controller.dart';
import 'package:get/get.dart';

class MyRecipesView extends GetView<MyRecipesController> {
  const MyRecipesView({Key? key}) : super(key: key);

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
                              child: Text('${index + 3587}'),
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(
                                Icons.comment,
                                size: 15,
                              ),
                              Text(' 173')
                            ],
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
      floatingActionButton: FloatingActionButton(
        onPressed: controller.addRecipe,
        child: const Icon(Icons.add),
      ),
    );
  }
}
