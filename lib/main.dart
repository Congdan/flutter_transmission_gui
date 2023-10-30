import 'package:flutter/material.dart';
import 'package:flutter_transmission_gui/route/add_server_page.dart';
import 'package:flutter_transmission_gui/route/home_page.dart';
import 'package:flutter_transmission_gui/states/settings_change_notifier.dart';
import 'package:provider/provider.dart';

import 'common/global.dart';

void main() => Global.init().then((value) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ServerModel()),
          ChangeNotifierProvider(create: (_) => LocaleModel())
        ],
        child: Consumer<LocaleModel>(
          builder: (BuildContext context, localeModel, child) {
            return MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
                  useMaterial3: true,
                ),
                routes: <String, WidgetBuilder>{
                  "add_server": (context) => AddServerRoute(),
                },
                home: HomeRoute());
          },
        ));
  }
}
