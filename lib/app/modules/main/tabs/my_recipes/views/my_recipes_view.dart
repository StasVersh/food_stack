import 'package:flutter/material.dart';
import 'package:food_stack/app/core/values/locale_keys.dart';
import 'package:food_stack/app/modules/main/tabs/my_recipes/controllers/my_recipes_controller.dart';
import 'package:get/get.dart';

class MyRecipesView extends GetView<MyRecipesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(LocaleKeys.myRecipes.tr),
      ),
    );
  }
}
