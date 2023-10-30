import 'package:json_annotation/json_annotation.dart';

part 'server.g.dart';

@JsonSerializable()
class Server {
  Server();

  String? name;
  String? url;
  String? port;
  late bool needAuthorization = false;
  String? username;
  String? password;
  String? sessionId;

  factory Server.fromJson(Map<String, dynamic> json) => _$ServerFromJson(json);
  Map<String, dynamic> toJson() => _$ServerToJson(this);
}
