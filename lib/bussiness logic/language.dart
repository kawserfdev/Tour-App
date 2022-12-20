import 'package:get/get.dart';
import '../ui/language/Einglish/english.dart';
import '../ui/language/bangla/bangla.dart';


class AppLanguages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': eng,
        'bn_BD': ban,
      };
}