import 'package:flutter/material.dart';
import 'package:food_stack/app/core/values/colors.dart';
import 'package:get/get.dart';
import '../controllers/recipe_review_controller.dart';

class RecipeReviewView extends GetView<RecipeReviewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appCherry,
        title: Text('Add Recipe'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.star_border),
          )
        ],
      ),
      body: Container(),
    );
  }
}
