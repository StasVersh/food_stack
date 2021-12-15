import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsCard extends Card {
  SettingsCard({
    Key? key,
    required String title,
    required IconData icon,
  }) : super(
          key: key,
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
