import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:food_stack/app/core/services/ingredients_service.dart';
import 'package:food_stack/app/core/services/recipe_service.dart';
import 'package:food_stack/app/core/services/storage_service.dart';
import 'package:food_stack/app/core/services/user_service.dart';
import 'package:food_stack/app/core/values/colors.dart';
import 'package:food_stack/app/core/values/locale_keys.dart';
import 'package:food_stack/app/modules/main/tabs/favorites/controllers/favorites_controller.dart';
import 'package:food_stack/app/modules/main/tabs/my_recipes/controllers/my_recipes_controller.dart';
import 'package:food_stack/app/modules/main/tabs/top/controllers/top_controller.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'package:intl/intl.dart';
import 'app/core/values/app_translations.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  Intl.defaultLocale = ui.window.locale.toLanguageTag();
  runApp(
    GetMaterialApp(
      title: LocaleKeys.foodStack,
      initialRoute: Routes.MAIN,
      getPages: AppPages.routes,
      locale: ui.window.locale,
      translationsKeys: AppTranslation.translations,
      localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
      supportedLocales: const [Locale('en'), Locale('ru')],
      theme: ThemeData(
        accentColor: AppColors.appCherry,
        secondaryHeaderColor: AppColors.appCherry,
        splashColor: AppColors.appCherry,
      ),
    ),
  );
}

///Init global services.
Future init() async {
  await Get.putAsync<FirebaseApp>(() async => await Firebase.initializeApp(),
      permanent: true);
  Get.put<FirebaseFirestore>(FirebaseFirestore.instance, permanent: true);
  Get.put<FirebaseStorage>(FirebaseStorage.instance, permanent: true);
  Get.put<RecipeService>(RecipeService(Get.find()), permanent: true);
  Get.put<StorageService>(StorageService(), permanent: true);
  Get.put<UserService>(UserService(Get.find()), permanent: true);
  Get.put<IngredientsService>(IngredientsService(Get.find()), permanent: true);
  Get.put<TopController>(TopController(Get.find(), Get.find()),
      permanent: true);
  Get.put<FavoritesController>(FavoritesController(Get.find(), Get.find()),
      permanent: true);
  Get.put<MyRecipesController>(MyRecipesController(Get.find()),
      permanent: true);
}
