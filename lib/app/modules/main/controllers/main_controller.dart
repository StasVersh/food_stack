import 'package:flutter/cupertino.dart';
import 'package:food_stack/app/modules/main/tabs/favorites/views/favorites_view.dart';
import 'package:food_stack/app/modules/main/tabs/my_recipes/views/my_recipes_view.dart';
import 'package:food_stack/app/modules/main/tabs/search/views/search_view.dart';
import 'package:food_stack/app/modules/main/tabs/top/views/top_view.dart';
import 'package:food_stack/app/modules/main/tabs/user/views/user_view.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final selectedIconIndex = 1.obs;
  final List<Widget> pages = [
    SearchView(),
    TopView(),
    FavoritesView(),
    MyRecipesView(),
    UserView(),
  ].obs;

  void onTapIcon(int index) {
    selectedIconIndex.value = index;
  }

  MainController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
