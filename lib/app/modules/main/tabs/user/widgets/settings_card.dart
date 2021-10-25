import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_stack/app/core/values/colors.dart';
import 'package:food_stack/app/data/model/recipe.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class SettingsCard extends Card {
  SettingsCard({
    required String title,
    required IconData icon,
  }) : super(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: ListTile(
            leading: FaIcon(
              icon,
            ),
            title: Text(title),
          ),
        );
}
