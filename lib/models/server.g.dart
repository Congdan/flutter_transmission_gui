// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Server _$ServerFromJson(Map<String, dynamic> json) => Server()
  ..name = json['name'] as String?
  ..url = json['url'] as String?
  ..port = json['port'] as String?
  ..needAuthorization = json['needAuthorization'] as bool
  ..username = json['username'] as String?
  ..password = json['password'] as String?
  ..sessionId = json['sessionId'] as String?;

Map<String, dynamic> _$ServerToJson(Server instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'port': instance.port,
      'needAuthorization': instance.needAuthorization,
      'username': instance.username,
      'password': instance.password,
      'sessionId': instance.sessionId,
    };
