import 'package:flutter/material.dart';
import 'package:food_stack/app/core/values/colors.dart';
import 'package:food_stack/app/data/model/recipe.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class RecipeCard extends Card {
  RecipeCard({
    required Recipe recipe,
    required Function onPress,
    required Function onFavorites,
    required Rx<Color> color,
    required int index,
  }) : super(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Obx(() {
            return InkWell(
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
                        onPressed: () => onFavorites(),
                        icon: Icon(
                          Icons.star_border,
                          color: color.value,
                        ),
                      ),
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
          }),
        );
}
