import 'package:flutter/material.dart';
import 'package:food_stack/app/core/values/locale_keys.dart';
import 'package:food_stack/app/modules/main/tabs/favorites/controllers/favorites_controller.dart';
import 'package:get/get.dart';

class FavoritesView extends GetView<FavoritesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(LocaleKeys.favorite.tr),
      ),
    );
  }
}
