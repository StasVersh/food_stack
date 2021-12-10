import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_stack/app/data/model/recipe.dart';

class RecipeCard extends Card {
  RecipeCard({
    Key? key,
    required Recipe recipe,
    Widget? leading,
    Widget? trailing,
    Widget? subtitle,
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
                    child: CachedNetworkImage(
                        imageUrl: recipe.picture,
                        placeholder: (context, url) {
                          return Container(
                            height: 200,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Colors.black26,
                              ),
                            ),
                          );
                        }),
                  ),
                  ListTile(
                    title: Text(recipe.title),
                    subtitle: subtitle,
                    trailing: trailing,
                    leading: leading,
                  ),
                ],
              ),
            ),
          ),
        );
}
