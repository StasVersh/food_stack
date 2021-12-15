import 'package:flutter/material.dart';
import 'package:food_stack/app/core/values/colors.dart';
import 'package:food_stack/app/core/values/locale_keys.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class NewStepCard extends Card {
  NewStepCard({
    Key? key,
    required int index,
    required TextEditingController controller,
    required Function onChanged,
  }) : super(
          key: key,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          shadowColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 50,
                  child: Center(
                    child: Text('$index. '),
                  ),
                ),
                Expanded(
                  child: TextField(
                    onChanged: onChanged(),
                    controller: controller,
                    decoration: InputDecoration.collapsed(
                      hintText: LocaleKeys.typing.tr,
                      hintStyle: const TextStyle(
                        color: AppColors.appGray,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
}
