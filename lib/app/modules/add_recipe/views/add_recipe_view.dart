import 'package:flutter/material.dart';
import 'package:food_stack/app/core/values/colors.dart';
import 'package:get/get.dart';
import '../controllers/add_recipe_controller.dart';

class AddRecipeView extends GetView<AddRecipeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appCherry,
        title: Text('Add Recipe'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: controller.save,
            icon: Icon(Icons.save),
          )
        ],
      ),
      body: Container(),
    );
  }
}
