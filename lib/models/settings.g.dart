// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Settings _$SettingsFromJson(Map<String, dynamic> json) => Settings()
  ..server = json['server'] == null
      ? null
      : Server.fromJson(json['server'] as Map<String, dynamic>);

Map<String, dynamic> _$SettingsToJson(Settings instance) => <String, dynamic>{
      'server': instance.server,
    };
