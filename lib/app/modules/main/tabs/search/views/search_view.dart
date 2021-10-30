import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_stack/app/core/values/colors.dart';
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
                icon: FontAwesomeIcons.coffee,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8,
                left: 8,
              ),
              child: SearchCard(
                title: LocaleKeys.forLunch.tr,
                icon: FontAwesomeIcons.utensils,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8,
                left: 8,
              ),
              child: SearchCard(
                title: LocaleKeys.forDinner.tr,
                icon: FontAwesomeIcons.conciergeBell,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8,
                left: 8,
              ),
              child: SearchCard(
                title: LocaleKeys.student.tr,
                icon: FontAwesomeIcons.graduationCap,
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
                icon: Icons.dinner_dining,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8,
                left: 8,
              ),
              child: SearchCard(
                title: LocaleKeys.bakery.tr,
                icon: FontAwesomeIcons.breadSlice,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8,
                left: 8,
              ),
              child: SearchCard(
                title: LocaleKeys.salads.tr,
                icon: FontAwesomeIcons.carrot,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8,
                left: 8,
              ),
              child: SearchCard(
                title: LocaleKeys.meat.tr,
                icon: FontAwesomeIcons.drumstickBite,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8,
                left: 8,
              ),
              child: SearchCard(
                title: LocaleKeys.fish.tr,
                icon: FontAwesomeIcons.fish,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8,
                left: 8,
              ),
              child: SearchCard(
                title: LocaleKeys.desserts.tr,
                icon: FontAwesomeIcons.cheese,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8,
                left: 8,
              ),
              child: SearchCard(
                title: LocaleKeys.peppery.tr,
                icon: FontAwesomeIcons.pepperHot,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8,
                left: 8,
              ),
              child: SearchCard(
                title: LocaleKeys.fastFood.tr,
                icon: FontAwesomeIcons.hamburger,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
