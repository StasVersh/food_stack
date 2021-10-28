import 'package:flutter/material.dart';
import 'package:food_stack/app/core/values/colors.dart';
import 'package:food_stack/app/core/values/locale_keys.dart';
import 'package:food_stack/app/modules/add_recipe/widgets/new_stap_card.dart';
import 'package:get/get.dart';
import '../controllers/add_recipe_controller.dart';

class AddRecipeView extends GetView<AddRecipeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appCherry,
        title: Text(LocaleKeys.addRecipe.tr),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: controller.save,
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.network(controller.imageSrc.value),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  onChanged: (var value) => controller.title = value,
                  decoration: const InputDecoration.collapsed(
                    hintText: 'Title...',
                    hintStyle: TextStyle(
                      color: Colors.black26,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Recipe: ',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          right: 8.0,
                        ),
                        child: NewStepCard(
                          onChanged: controller.onEditingChanged,
                          controller: controller.textEditingController.value,
                          index: index + 1,
                        ),
                      );
                    },
                    itemCount: controller.body.length,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
