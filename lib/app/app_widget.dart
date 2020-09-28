import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:planets/app/config/theme/colors.dart';
import 'package:planets/app/modules/home/home_controller.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'Planets',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: primaryColor
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
