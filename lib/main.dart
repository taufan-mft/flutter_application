import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application/buy_list.dart';
import 'package:flutter_application/provider/mainstate.dart';
import 'package:provider/provider.dart';
import 'data.dart';
import 'detail.dart';
import 'home.dart';

void main() => runApp(ChangeNotifierProvider(
    lazy: false, create: (context) => MainState(), child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIM JAEYUN STORE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Home(),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }

  generateRoute(RouteSettings settings) {
    final path = settings.name?.split('/');

    if (path![0] == 'detail') {
      final title = path[1];
      Baju baju = bajus.firstWhere((it) => it.jenis == title);
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => Detail(baju),
      );
    }
    if (path[0] == 'buylist') {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => BuyListView()
      );
    }
  }
}
