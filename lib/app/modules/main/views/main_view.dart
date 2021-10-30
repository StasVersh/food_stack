import 'package:flutter/material.dart';
import 'package:food_stack/app/core/values/colors.dart';
import 'package:food_stack/app/core/values/locale_keys.dart';
import 'package:get/get.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return controller.pages.elementAt(controller.selectedIconIndex.value);
      }),
      bottomNavigationBar: Obx(
        () {
          return BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            showUnselectedLabels: false,
            unselectedItemColor: Colors.black26,
            selectedItemColor: AppColors.appCherry,
            currentIndex: controller.selectedIconIndex.value,
            onTap: (value) => controller.onTapIcon(value),
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.search),
                label: LocaleKeys.search.tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.local_fire_department),
                label: LocaleKeys.top100.tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.receipt),
                label: LocaleKeys.myRecipes.tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.star),
                label: LocaleKeys.favorite.tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.account_circle),
                label: LocaleKeys.user.tr,
              ),
            ],
          );
        },
      ),
    );
  }
}
