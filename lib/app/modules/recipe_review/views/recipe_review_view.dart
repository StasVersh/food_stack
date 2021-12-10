import 'package:cached_network_image/cached_network_image.dart';
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
        title: Text(controller.recipe.title),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: CachedNetworkImage(
                    imageUrl: controller.recipe.picture,
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      color: AppColors.appCherry,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Молоко',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Wrap(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          color: AppColors.appCherry,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Молоко',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Wrap(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          color: AppColors.appCherry,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Молоко',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Wrap(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          color: AppColors.appCherry,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Молоко',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Wrap(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          color: AppColors.appCherry,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Молоко',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Wrap(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          color: AppColors.appCherry,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Молоко',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
