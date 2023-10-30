import 'package:json_annotation/json_annotation.dart';
import "server.dart";
part 'settings.g.dart';

@JsonSerializable()
class Settings {
  Settings();

  Server? server;
  
  factory Settings.fromJson(Map<String,dynamic> json) => _$SettingsFromJson(json);
  Map<String, dynamic> toJson() => _$SettingsToJson(this);
}
