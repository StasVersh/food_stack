import 'package:flutter/material.dart';
import 'package:food_stack/app/core/values/colors.dart';
import 'package:food_stack/app/data/model/recipe.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class NewStepCard extends Card {
  NewStepCard({
    required int index,
    required TextEditingController controller,
    required Function onChanged,
  }) : super(
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
                Container(
                  width: 50,
                  child: Center(
                    child: Text('$index. '),
                  ),
                ),
                Expanded(
                  child: TextField(
                    onChanged: onChanged(),
                    controller: controller,
                    decoration: const InputDecoration.collapsed(
                      hintText: 'Typing...',
                      hintStyle: TextStyle(
                        color: Colors.black26,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
}
