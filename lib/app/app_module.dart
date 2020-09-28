import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:planets/app/app_widget.dart';
import 'package:planets/app/modules/splash_screen/splash_screen_page.dart';

import 'app_controller.dart';
import 'modules/home/home_module.dart';
import 'modules/splash_screen/splash_screen_controller.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $SplashScreenController,
        $AppController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => SplashScreenPage()),
        ModularRouter('/home', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
