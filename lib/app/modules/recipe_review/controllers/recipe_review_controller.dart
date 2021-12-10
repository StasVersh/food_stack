import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_stack/app/data/model/recipe.dart';
import 'package:get/get.dart';

class RecipeReviewController extends GetxController {
  var recipe = Recipe('', [''], [''], '', '', '', '');
  final img = CachedNetworkImage(imageUrl: '').obs;

  RecipeReviewController() {}

  void loadingImg() {
    Container(
      height: 200,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  void onInit() {
    recipe = Get.arguments;
    img.value = CachedNetworkImage(
        imageUrl: recipe.picture,
        placeholder: (context, url) {
          return Container(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          );
        });
    super.onInit();
  }

  void load() async {}

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
