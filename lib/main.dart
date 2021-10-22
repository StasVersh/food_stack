import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:food_stack/app/core/services/recipe_service.dart';
import 'package:food_stack/app/core/values/colors.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'package:intl/intl.dart';
import 'app/core/values/app_translations.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  Intl.defaultLocale = ui.window.locale.toLanguageTag();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: Routes.MAIN,
      getPages: AppPages.routes,
      locale: ui.window.locale,
      translationsKeys: AppTranslation.translations,
      localizationsDelegates: [GlobalMaterialLocalizations.delegate],
      supportedLocales: [const Locale('en'), const Locale('ru')],
      theme: ThemeData(
        primaryColor: Colors.purple,
        accentColor: AppColors.appCherry,
        secondaryHeaderColor: AppColors.appCherry,
        splashColor: AppColors.appCherry,
      ),
    ),
  );
}

///Init global services.
Future initServices() async {
  await Get.putAsync<FirebaseApp>(() async => await Firebase.initializeApp(),
      permanent: true);
  Get.put<FirebaseFirestore>(FirebaseFirestore.instance, permanent: true);
  Get.put<RecipeService>(RecipeService(Get.find()), permanent: true);
}
