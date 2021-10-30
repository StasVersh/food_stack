import 'package:flutter/material.dart';
import 'package:food_stack/app/data/model/recipe.dart';

class RecipeCard extends Card {
  RecipeCard({
    Key? key,
    required Recipe recipe,
    Widget? leading,
    Widget? trailing,
  }) : super(
          key: key,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: InkWell(
            hoverColor: Colors.black26,
            splashColor: Colors.black26,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.network(recipe.picture),
                  ),
                  ListTile(
                    title: Text(recipe.title),
                    subtitle: const Text('Ингридиенты: тесто, перец, ...'),
                    trailing: trailing,
                    leading: leading,
                  ),
                ],
              ),
            ),
          ),
        );
}
