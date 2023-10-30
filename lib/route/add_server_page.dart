import 'package:flutter/material.dart';
import 'package:flutter_transmission_gui/common/global.dart';
import 'package:flutter_transmission_gui/states/settings_change_notifier.dart';
import 'package:provider/provider.dart';

import '../models/server.dart';

class AddServerRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddServerRouteState();
}

class _AddServerRouteState extends State<AddServerRoute> {
  bool _hasAuthorization = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _portController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Server globalServer = Global.settings.server ?? Server();
  Server server = Server();

  @override
  void initState() {
    super.initState();

    server.name = globalServer.name;
    server.url = globalServer.url;
    server.port = globalServer.port;
    server.username = globalServer.username;
    server.password = globalServer.password;
    server.needAuthorization = globalServer.needAuthorization;

    _nameController.text = server.name ?? "";
    _urlController.text = server.url ?? "";
    _portController.text = server.port ?? "";
    _usernameController.text = server.username ?? "";
    _passwordController.text = server.password ?? "";
    _hasAuthorization = server.needAuthorization;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _urlController.dispose();
    _portController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void submitForm() {
    server.name = _nameController.text;
    server.url = _urlController.text;
    server.port = _portController.text;
    server.username = _usernameController.text;
    server.password = _passwordController.text;
    server.needAuthorization = _hasAuthorization;
    Provider.of<ServerModel>(context, listen: false).server = server;
    Navigator.pop(context);
  }

  void deleteServer() {
    Provider.of<ServerModel>(context, listen: false).server = Server();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transmission"),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        actions: [
          IconButton(onPressed: submitForm, icon: Icon(Icons.save)),
          IconButton(onPressed: deleteServer, icon: Icon(Icons.delete))
        ],
      ),
      body: Container(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SingleInputField(name: "Name", controller: _nameController),
              SingleInputField(
                name: "URL",
                controller: _urlController,
              ),
              SingleInputField(
                name: "Port",
                textInputType: TextInputType.number,
                controller: _portController,
              ),
              Row(
                children: [
                  Checkbox(
                      value: _hasAuthorization,
                      onChanged: (value) {
                        setState(() {
                          _hasAuthorization = value!;
                        });
                      }),
                  Text(
                    "Authorization",
                    textScaleFactor: 1.2,
                  )
                ],
              ),
              SingleInputField(
                name: "Username",
                enabled: _hasAuthorization,
                controller: _usernameController,
              ),
              SingleInputField(
                name: "Password",
                obscureText: true,
                enabled: _hasAuthorization,
                controller: _passwordController,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     ElevatedButton(
              //       child: Text("Confirm"),
              //       onPressed: submitForm,
              //     ),
              //     ElevatedButton(
              //       child: Text("Cancel"),
              //       onPressed: () {
              //         Navigator.pop(context);
              //       },
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class SingleInputField extends StatefulWidget {
  const SingleInputField({
    Key? key,
    required this.name,
    required this.controller,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
    this.enabled = true,
    this.icon,
  }) : super(key: key);

  final String name;
  final Icon? icon;
  final bool obscureText;
  final TextInputType textInputType;
  final bool enabled;
  final TextEditingController controller;

  @override
  State<SingleInputField> createState() => _SingleInputFieldState();
}

class _SingleInputFieldState extends State<SingleInputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.0),
      child: TextField(
        decoration:
            InputDecoration(labelText: widget.name, prefixIcon: widget.icon),
        obscureText: widget.obscureText,
        keyboardType: widget.textInputType,
        enabled: widget.enabled,
        controller: widget.controller,
      ),
    );
  }
}
