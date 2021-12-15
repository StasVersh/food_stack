import 'package:flutter/material.dart';
import 'package:food_stack/app/core/values/colors.dart';
import 'package:food_stack/app/core/values/icons_path.dart';
import 'package:food_stack/app/core/values/locale_keys.dart';
import 'package:food_stack/app/modules/main/tabs/search/controllers/search_controller.dart';
import 'package:food_stack/app/modules/main/tabs/search/widgets/search_card.dart';
import 'package:get/get.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 8,
                left: 8,
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: ListTile(
                  leading: const Icon(
                    Icons.search,
                    color: AppColors.appCherry,
                  ),
                  title: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: LocaleKeys.searchPoints.tr,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8,
                left: 8,
              ),
              child: SearchCard(
                title: LocaleKeys.forBreakfast.tr,
                icon: IconsData.coffee,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8,
                left: 8,
              ),
              child: SearchCard(
                title: LocaleKeys.forLunch.tr,
                icon: IconsData.utensils,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8,
                left: 8,
              ),
              child: SearchCard(
                title: LocaleKeys.forDinner.tr,
                icon: IconsData.conciergeBell,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8,
                left: 8,
              ),
              child: SearchCard(
                title: LocaleKeys.student.tr,
                icon: IconsData.graduationCap,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8,
                left: 8,
              ),
              child: SearchCard(
                title: LocaleKeys.dishes.tr,
                icon: IconsData.dinner,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8,
                left: 8,
              ),
              child: SearchCard(
                title: LocaleKeys.bakery.tr,
                icon: IconsData.bread,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8,
                left: 8,
              ),
              child: SearchCard(
                title: LocaleKeys.salads.tr,
                icon: IconsData.carrot,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8,
                left: 8,
              ),
              child: SearchCard(
                title: LocaleKeys.meat.tr,
                icon: IconsData.drumstickBite,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8,
                left: 8,
              ),
              child: SearchCard(
                title: LocaleKeys.fish.tr,
                icon: IconsData.fish,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8,
                left: 8,
              ),
              child: SearchCard(
                title: LocaleKeys.desserts.tr,
                icon: IconsData.cheese,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8,
                left: 8,
              ),
              child: SearchCard(
                title: LocaleKeys.peppery.tr,
                icon: IconsData.pepperHot,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8,
                left: 8,
              ),
              child: SearchCard(
                title: LocaleKeys.fastFood.tr,
                icon: IconsData.hamburger,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
