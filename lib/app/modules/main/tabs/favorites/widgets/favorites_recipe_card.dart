import 'package:flutter/material.dart';
import 'package:food_stack/app/core/values/colors.dart';
import 'package:food_stack/app/data/model/recipe.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class FavoritesRecipeCard extends Card {
  FavoritesRecipeCard({
    required Recipe recipe,
    required Function onPress,
    required Function onFavorite,
  }) : super(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: InkWell(
            onTap: onPress(),
            hoverColor: Colors.black26,
            splashColor: Colors.black26,
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
                    trailing: IconButton(
                      splashRadius: 15,
                      onPressed: onFavorite(),
                      icon: Icon(
                        Icons.star,
                        color: AppColors.appCherry,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
}
