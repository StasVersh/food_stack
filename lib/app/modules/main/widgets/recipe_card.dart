import 'package:flutter/material.dart';
import 'package:food_stack/app/data/model/recipe.dart';

class RecipeCard extends Card {
  RecipeCard({
    required Recipe recipe,
    required Function onPress,
    required int index,
  }) : super(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.network(recipe.picture),
                ),
                ListTile(
                  title: Text(recipe.title),
                  subtitle: Text('Ингридиенты: тесто, перец, ...'),
                  trailing: Icon(Icons.star_border),
                  leading: Container(
                    width: 40,
                    height: 40,
                    child: Center(
                      child: Text(
                        index.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
}
