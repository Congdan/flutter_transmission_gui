import 'package:flutter/material.dart';
import 'package:flutter_transmission_gui/states/settings_change_notifier.dart';
import 'package:provider/provider.dart';

class HomeRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transmission"),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      drawer: MyDrawer(),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
          children: [_buildHeader(), Expanded(child: _buildMenu(context))]),
    );
  }

  Widget _buildHeader() {
    return Consumer<ServerModel>(
        builder: (BuildContext context, ServerModel server, child) {
      String serverName = server.server.name ?? "D";
      return GestureDetector(
        child: Container(
          color: Theme.of(context).primaryColor,
          padding: EdgeInsets.only(top: 40, bottom: 20),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: server.server.name == null
                  ? CircleAvatar(
                      backgroundImage: AssetImage('imgs/transmission_icon.png'),
                    )
                  : CircleAvatar(
                      child: Text(serverName[0].toUpperCase()),
                    ),
            )
          ]),
        ),
      );
    });
  }

  Widget _buildMenu(context) {
    return Consumer<ServerModel>(
        builder: (BuildContext context, ServerModel serverModel, child) {
      if (serverModel.server.name != null) {
        return _menuWithServer(context);
      } else {
        return _menuWithoutServer(context);
      }
    });
  }

  Widget _menuWithServer(context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.settings),
          title: Text("Server Settings"),
          onTap: () {
            Navigator.pushNamed(context, "add_server");
          },
        )
      ],
    );
  }

  Widget _menuWithoutServer(context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.add),
          title: Text("Add Server"),
          onTap: () {
            Navigator.pushNamed(context, "add_server");
          },
        )
      ],
    );
  }
}
