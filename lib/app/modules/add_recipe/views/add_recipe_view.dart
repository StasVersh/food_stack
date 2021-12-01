import 'package:flutter/material.dart';
import 'package:food_stack/app/core/values/colors.dart';
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
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: ListView(
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
                        : Container(
                            height: 200,
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(Icons.add),
                                  Text(
                                    'Add Image',
                                    style: TextStyle(
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
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Recipe: ',
                      style: TextStyle(
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
                                  Container(
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
                                      decoration:
                                          const InputDecoration.collapsed(
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
                      'Ingredients: ',
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
                        Icons.search,
                        color: AppColors.appCherry,
                      ),
                      title: TextField(
                        onChanged: (value) => controller.onSearchChanged(value),
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
                        physics: NeverScrollableScrollPhysics(),
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
                                  child: Container(
                                    height: 20,
                                    child: Center(
                                      child: Text(
                                        controller.selected[index].name,
                                        style: TextStyle(
                                          color: Colors.white,
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
                      return Expanded(
                        child: SizedBox(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                  right: 8.0,
                                ),
                                child: GestureDetector(
                                  onTap: () => controller.ingredientTap(index),
                                  child: Card(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Container(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            controller.unselected[index].name,
                                            style: TextStyle(
                                              color: Colors.black,
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
                                title: const Text(
                                  'Создать ингредиент',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
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
    );
  }
}
