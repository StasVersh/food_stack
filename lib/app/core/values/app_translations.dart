import 'ru_RU_translation.dart';
import 'en_us_translation.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'ru_RU': ru_RU,
    'en_UK': en_UK,
  };
}
