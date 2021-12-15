import 'package:flutter/material.dart';
import 'package:food_stack/app/core/values/colors.dart';
import 'package:food_stack/app/core/values/icons_path.dart';
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
            unselectedItemColor: AppColors.appGray,
            selectedItemColor: AppColors.appCherry,
            currentIndex: controller.selectedIconIndex.value,
            onTap: (value) => controller.onTapIcon(value),
            items: [
              BottomNavigationBarItem(
                icon: const Icon(IconsData.search),
                label: LocaleKeys.search.tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(IconsData.fire),
                label: LocaleKeys.top100.tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(IconsData.receipt),
                label: LocaleKeys.myRecipes.tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(IconsData.star),
                label: LocaleKeys.favorite.tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(IconsData.account),
                label: LocaleKeys.user.tr,
              ),
            ],
          );
        },
      ),
    );
  }
}
