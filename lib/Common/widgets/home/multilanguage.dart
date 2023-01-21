import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:scanner/Common/Utilities/shared_storage.dart';


import 'package:shared_preferences/shared_preferences.dart';

/// FEEL FREE TO LOAD THIS CLASS WITH YOUR CURRENT JSOM FILES
/// REMEMBER YOU SHOULD LOAD IT FIRST IN YOUR PUBSPEC.YAML
class Languages {
  static const String en = 'lang/en.json';
  static const String th = 'lang/th.json';
  static const String cn = 'lang/zh-CN.json';
  static const String tw = 'lang/zh-TW.json';
  static const String kr = 'lang/Kr.json';
  static const String jp = 'lang/Jp.json';
}

/// THE NAME OF CURRENT JSON FILE INSIDE THE APP CACHE
String _langKey = SharedStorage.getString("langKey");

/// THE NAME OF THE CLASS WHICH MANAGES THE MULTI-LANGUAGE PACKAGE
class MultiLanguage {
  Map<String, dynamic>? phrases;
  MultiLanguage(this.phrases);

  static setLanguage(
      {required String path, required BuildContext context}) async {
    _langKey = path;
    //SharedStorage.setString("LanguageString", path);

    final prefs = await SharedPreferences.getInstance();

    if (prefs.getString(_langKey) != null &&
        prefs.getString(_langKey)!.length > 0)
      path = prefs.getString(_langKey)!;

    var file = await DefaultAssetBundle.of(context).loadString(_langKey);

    prefs.setString(_langKey, path);

    multilang = MultiLanguage(jsonDecode(file));
  }

  String get(String key, String keyValue) {
    return phrases != null ? phrases![key][keyValue] : key;
  }
}

/// INITIALIZE THE MULTILANG - YOU WILL BE USING THIS AROUND YOUR APPLICATION
MultiLanguage multilang = MultiLanguage(null);

/// SHORTCUT FOR THE GETTER TEXT
Function(String key, String keyValue) get txt => multilang.get;

/// SHORTCUT FOR THE GETTER UPPERCASE TEXT
Function(String key, String keyValue) get uptxt =>
    (String key, String keyValue) => multilang.get(key, keyValue).toUpperCase();
