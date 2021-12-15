import 'package:flutter/material.dart';
import 'package:food_stack/app/core/values/colors.dart';
import 'package:food_stack/app/core/values/icons_path.dart';
import 'package:food_stack/app/core/values/locale_keys.dart';
import 'package:get/get.dart';
import '../controllers/add_recipe_controller.dart';

class AddRecipeView extends GetView<AddRecipeController> {
  const AddRecipeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appCherry,
        title: Text(LocaleKeys.addRecipe.tr),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => controller.save(context),
            icon: const Icon(IconsData.save),
          )
        ],
      ),
      body: NotificationListener(
        onNotification: (notification) =>
            controller.listViewChanged(notification, context),
        child: ListView(
          controller: controller.listViewController.value,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: controller.imageSelectorTap,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Obx(() {
                    return Container(
                      child: controller.imageAdded.value
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: Image.file(controller.file.value),
                            )
                          : SizedBox(
                              height: 200,
                              child: Center(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(IconsData.add),
                                    Text(
                                      LocaleKeys.addImage.tr,
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    );
                  }),
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
                    textCapitalization: TextCapitalization.sentences,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    onChanged: (var value) => controller.title = value,
                    decoration: InputDecoration.collapsed(
                      hintText: LocaleKeys.title.tr,
                      hintStyle: const TextStyle(
                        color: AppColors.appGray,
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
                        LocaleKeys.recipe.tr,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Obx(() {
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              right: 8.0,
                            ),
                            child: Card(
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
                                        child: Text('${index + 1}. '),
                                      ),
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        keyboardType: TextInputType.multiline,
                                        maxLines: null,
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        onChanged: (value) =>
                                            controller.onEditingChanged(index),
                                        controller: controller
                                            .textEditingControllers[index],
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
                            ),
                          );
                        },
                        itemCount: controller.textEditingControllers.length,
                      );
                    }),
                  ],
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
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        LocaleKeys.ingredients,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: ListTile(
                        leading: const Icon(
                          IconsData.search,
                          color: AppColors.appCherry,
                        ),
                        title: TextField(
                          onChanged: (value) =>
                              controller.onSearchChanged(value),
                          textCapitalization: TextCapitalization.sentences,
                          decoration: InputDecoration.collapsed(
                            hintText: LocaleKeys.searchPoints.tr,
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () {
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                right: 8.0,
                              ),
                              child: GestureDetector(
                                onTap: () => controller.selectedTap(index),
                                child: Card(
                                  color: AppColors.appCherry,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: SizedBox(
                                      height: 20,
                                      child: Center(
                                        child: Text(
                                          controller.selected[index].name,
                                          style: const TextStyle(
                                            color: AppColors.appWhite,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: controller.selected.length,
                        );
                      },
                    ),
                    Obx(
                      () {
                        return SizedBox(
                          child: Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8.0,
                                    right: 8.0,
                                  ),
                                  child: GestureDetector(
                                    onTap: () =>
                                        controller.ingredientTap(index),
                                    child: Card(
                                      color: AppColors.appWhite,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: SizedBox(
                                          height: 20,
                                          child: Center(
                                            child: Text(
                                              controller.unselected[index].name,
                                              style: const TextStyle(
                                                color: AppColors.appBlack,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              itemCount: controller.unselected.length,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () => controller.createIngredient(context),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 50,
                                child: ListTile(
                                  onTap: () =>
                                      controller.createIngredient(context),
                                  title: Text(
                                    LocaleKeys.createIngredients.tr,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: AppColors.appCherry,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButton: Obx(
        () {
          return controller.isVisible.value
              ? FloatingActionButton(
                  onPressed: controller.jumpToStart,
                  child: const Icon(IconsData.arrowUp),
                )
              : Container();
        },
      ),
    );
  }
}
