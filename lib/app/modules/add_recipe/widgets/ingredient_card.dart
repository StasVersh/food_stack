import 'package:flutter/material.dart';
import 'package:food_stack/app/core/values/colors.dart';
import 'package:food_stack/app/data/model/ingredient.dart';
import 'package:food_stack/app/data/model/recipe.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class IngredientCard extends Card {
  IngredientCard({
    required Ingredient ingredient,
  }) : super(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          shadowColor: Colors.transparent,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                child: Center(
                  child: Text(ingredient.name),
                ),
              )),
        );
}
