import 'package:flutter/material.dart';
import 'package:food_stack/app/core/values/colors.dart';
import 'package:food_stack/app/core/values/icons_path.dart';
import 'package:food_stack/app/core/values/locale_keys.dart';
import 'package:food_stack/app/modules/main/tabs/user/controllers/user_controller.dart';
import 'package:food_stack/app/modules/main/tabs/user/widgets/settings_card.dart';
import 'package:get/get.dart';

class UserView extends GetView<UserController> {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              height: 300,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(
                      backgroundColor: AppColors.appCherry,
                      radius: 55,
                    ),
                    Container(
                      height: 25,
                    ),
                    const Text(
                      'Станислав Вершилович',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8,
                left: 8,
              ),
              child: SettingsCard(
                title: LocaleKeys.profile.tr,
                icon: IconsData.list,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8,
                left: 8,
              ),
              child: SettingsCard(
                title: LocaleKeys.favoriteIngredients.tr,
                icon: IconsData.favorite,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8,
                left: 8,
              ),
              child: SettingsCard(
                title: LocaleKeys.blackList.tr,
                icon: IconsData.block,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8,
                left: 8,
              ),
              child: SettingsCard(
                title: LocaleKeys.languages.tr,
                icon: IconsData.language,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8,
                left: 8,
              ),
              child: SettingsCard(
                title: LocaleKeys.privacyPolicy.tr,
                icon: IconsData.verified,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8,
                left: 8,
              ),
              child: SettingsCard(
                title: LocaleKeys.about.tr,
                icon: IconsData.info,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
