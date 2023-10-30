import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_transmission_gui/models/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global {
  static late SharedPreferences _sharedPreferences;

  static Settings settings = Settings();

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    _sharedPreferences = await SharedPreferences.getInstance();

    var _settings = _sharedPreferences.getString("settings");
    if (_settings != null) {
      try {
        settings = Settings.fromJson(jsonDecode(_settings));
      } catch (e) {
        print(e);
      }
    } else {
      settings = Settings();
    }
  }

  static saveSettings() =>
      _sharedPreferences.setString("settings", jsonEncode(settings.toJson()));
}
