import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_stack/app/core/services/ingredients_service.dart';
import 'package:food_stack/app/core/services/recipe_service.dart';
import 'package:food_stack/app/core/services/storage_service.dart';
import 'package:food_stack/app/core/values/colors.dart';
import 'package:food_stack/app/core/values/database_constants.dart';
import 'package:food_stack/app/data/model/ingredient.dart';
import 'package:food_stack/app/data/model/recipe.dart';
import 'package:get/get.dart';

class AddRecipeController extends GetxController {
  final RecipeService _recipeService;
  final IngredientsService _ingredientsService;
  final StorageService _storageService;
  final unselected = <Ingredient>[].obs;
  final selected = <Ingredient>[].obs;
  final isVisible = false.obs;
  var imageAdded = false.obs;
  var ingredients = <Ingredient>[];
  var listViewController = ScrollController().obs;
  var textEditingControllers = <TextEditingController>[].obs;
  var listViewPosition = 0;

  var title = '';
  var body = <String>[];
  var imageSrc =
      'https://firebasestorage.googleapis.com/v0/b/foodstack-cf1df.appspot.com/o/images%2Fcake-2532303_1280.jpg?alt=media&token=59242eb0-9de1-4efc-bf32-91fc0bcbd6bd';
  var file = File('').obs;
  var ingredientsId = <String>[];

  AddRecipeController(
      this._recipeService, this._ingredientsService, this._storageService);

  void save(context) async {
    for (var element in textEditingControllers) {
      if (element.text != '') body.add(element.text);
    }
    for (var element in selected) {
      ingredientsId.add(element.id);
    }
    if (imageAdded.value) {
      _storageService.uploadFile(file.value).then((value) {
        imageSrc = value;
        var newRecipe = Recipe(
          title,
          body,
          ingredientsId,
          imageSrc,
          '',
          DatabasePaths.userId,
          '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
        );
        _recipeService.addRecipe(newRecipe);
        Get.back();
        Get.back<Recipe>(
          result: newRecipe,
        );
      });
      var dialog = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(18.0)),
              ),
              title: Text(
                'Сохранение...',
              ),
              content: SizedBox(
                height: 100,
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.appCherry,
                    strokeWidth: 6,
                  ),
                ),
              ),
            );
          });
    } else {
      var newRecipe = Recipe(
        title,
        body,
        ingredientsId,
        imageSrc,
        '',
        DatabasePaths.userId,
        '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
      );
      _recipeService.addRecipe(newRecipe);
      Get.back<Recipe>(
        result: newRecipe,
      );
    }
  }

  void ingredientTap(index) {
    var ingredient = unselected[index];
    unselected.remove(ingredient);
    selected.add(ingredient);
  }

  void selectedTap(index) {
    var ingredient = selected[index];
    selected.remove(ingredient);
    unselected.add(ingredient);
    unselected.sort((a, b) => a.name.compareTo(b.name));
  }

  Future<void> imageSelectorTap() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
    );
    if (result != null) {
      file.value = File(result.files.single.path!);
      imageAdded.value = true;
    }
  }

  void createIngredient(BuildContext context) async {
    TextEditingController controller = TextEditingController();
    var dialog = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(18.0)),
          ),
          title: const Text(
            'Создание ингридиента',
          ),
          content: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                textCapitalization: TextCapitalization.sentences,
                controller: controller,
                cursorColor: AppColors.appCherry,
                decoration: const InputDecoration.collapsed(
                  hintText: 'Название ингридиента...',
                  hintStyle: TextStyle(
                    color: Colors.black26,
                  ),
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Ok'),
              style: TextButton.styleFrom(
                primary: AppColors.appCherry,
              ),
              onPressed: () {
                List<String> recipeId = [];
                _ingredientsService
                    .addIngredient(Ingredient('', recipeId, controller.text));
                selected.add(Ingredient('', recipeId, controller.text));
                updateIngredients();
                Get.back();
              },
            ),
            TextButton(
              child: Text('Back'),
              style: TextButton.styleFrom(
                primary: AppColors.appCherry,
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }

  bool listViewChanged(notification, context) {
    print(isVisible);
    if (listViewController.value.position.pixels >
        MediaQuery.of(context).size.height / 2) {
      isVisible.value = true;
    } else {
      isVisible.value = false;
    }
    return true;
  }

  void onEditingChanged(index) {
    if (index == textEditingControllers.length - 1) {
      textEditingControllers.add(TextEditingController());
    }
    if (textEditingControllers[index].text == '' &&
        textEditingControllers.length > 1) {
      textEditingControllers.removeAt(index);
    }
  }

  void onSearchChanged(value) {
    var filtered = <Ingredient>[];
    ingredients.where((p0) => p0.name.contains(value)).forEach((element) {
      filtered.add(element);
    });
    unselected.value = filtered;
  }

  @override
  void onInit() {
    textEditingControllers.add(TextEditingController());
    updateIngredients();
    super.onInit();
  }

  Future<void> jumpToStart() async {
    await listViewController.value.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 200),
    );
  }

  void updateIngredients() {
    _ingredientsService.getIngredients().then((value) {
      ingredients = value;
      ingredients.sort((a, b) => a.name.compareTo(b.name));
      for (var element in selected) {
        ingredients.remove(element);
      }
      unselected.value = ingredients;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
