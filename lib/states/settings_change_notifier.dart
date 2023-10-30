import 'package:flutter/material.dart';
import 'package:flutter_transmission_gui/common/global.dart';
import 'package:flutter_transmission_gui/models/server.dart';
import 'package:flutter_transmission_gui/models/settings.dart';

class SettingsChangeNotifier extends ChangeNotifier {
  Settings get _settings => Global.settings;

  @override
  void notifyListeners() {
    Global.saveSettings();
    super.notifyListeners();
  }
}

class ServerModel extends SettingsChangeNotifier {
  Server get server => _settings.server ?? Server();

  set server(Server server) {
    if (server.name != _settings.server?.name) {
      _settings.server = server;
      notifyListeners();
    }
  }
}

class LocaleModel extends SettingsChangeNotifier {}
