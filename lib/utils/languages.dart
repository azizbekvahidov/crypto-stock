import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'uz': {
          'greeting': '안녕하세요',
        },
        'ru': {
          'greeting': 'こんにちは',
        },
        'en': {
          'greeting': 'Hello',
        },
      };
}
