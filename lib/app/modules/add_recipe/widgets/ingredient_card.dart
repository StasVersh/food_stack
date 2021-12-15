import 'package:flutter/material.dart';
import 'package:food_stack/app/data/model/ingredient.dart';

class IngredientCard extends Card {
  IngredientCard({
    Key? key,
    required Ingredient ingredient,
  }) : super(
          key: key,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 20,
              child: Center(
                child: Text(ingredient.name),
              ),
            ),
          ),
        );
}
