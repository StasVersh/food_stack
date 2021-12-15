import 'package:flutter/cupertino.dart';
import 'package:food_stack/app/modules/main/tabs/favorites/views/favorites_view.dart';
import 'package:food_stack/app/modules/main/tabs/my_recipes/views/my_recipes_view.dart';
import 'package:food_stack/app/modules/main/tabs/search/views/search_view.dart';
import 'package:food_stack/app/modules/main/tabs/top/views/top_view.dart';
import 'package:food_stack/app/modules/main/tabs/user/views/user_view.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final selectedIconIndex = 2.obs;
  final List<Widget> pages = [
    const SearchView(),
    const TopView(),
    const MyRecipesView(),
    const FavoritesView(),
    const UserView(),
  ].obs;

  void onTapIcon(int index) {
    selectedIconIndex.value = index;
  }
}
