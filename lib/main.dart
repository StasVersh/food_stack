import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:food_stack/app/core/values/colors.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'package:intl/intl.dart';
import 'app/core/values/app_translations.dart';
import 'app/routes/app_pages.dart';

void main() async {
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
Future initServices() async {}
