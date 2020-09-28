import 'package:flutter_modular/flutter_modular.dart';
import 'package:planets/app/modules/home/details/details_page.dart';

import 'details/details_controller.dart';
import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $DetailsController,
        $HomeController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
        ModularRouter('/details', child: (_, args) => DetailsPage(planet: args.data,)),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
