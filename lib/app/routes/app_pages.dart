import 'package:food_stack/app/modules/main/bindings/main_binding.dart';
import 'package:food_stack/app/modules/main/views/main_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage<MainView>(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
  ];
}
