// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "hello": "Hello, How are you?",
  "onboarding": {
    "onboarding_one": {
      "title1": "Trade at the cutting edge with our",
      "titleblue": " state-of-the-art ",
      "title3": "platform and stay ahead",
      "bodyText": "Explore total convenience for your trading journey with our 360-degree platform. Enjoy seamless trading and access extra features to elevate your financial experience."
    }
  }
};
static const Map<String,dynamic> fa = {
  "hello": "Hello, How are you?",
  "onboarding": {
    "onboarding_one": {
      "title1": "Trade at the cutting edge with our",
      "titleblue": " state-of-the-art ",
      "title3": "platform and stay ahead"
    }
  }
};
static const Map<String,dynamic> ar = {
  "hello": "Hello, How are you?",
  "onboarding": {
    "onboarding_one": {
      "title1": "Trade at the cutting edge with our",
      "titleblue": " state-of-the-art ",
      "title3": "platform and stay ahead"
    }
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "fa": fa, "ar": ar};
}
