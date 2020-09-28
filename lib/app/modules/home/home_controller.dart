import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:planets/app/models/planets_model.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  List<Planet> planets = [
    Planet(
      id: 1,
      name: "MERCURY",
      nickName: "SWIFT PLANET",
      image: "assets/images/planets/mercury.png",
      lengthOfYear: "88 Earth Days",
      distanceFromSun: "58 million km",
    ),
    Planet(
        id: 2,
        name: "VENUS",
        nickName: "MORNING STAR",
        image: "assets/images/planets/venus.png",
        lengthOfDay: " 116d 18h 0m",
        lengthOfYear: "225 Earth Days",
        distanceFromSun: "108.2 million km",
        radius: " 460.2 million km²"),
    Planet(
        id: 3,
        name: "EARTH",
        nickName: "THE BLUE PLANET",
        image: "assets/images/planets/earth.png",
        distanceFromSun: "150 million km"),
    Planet(
      id: 4,
      name: "MARS",
      nickName: "THE RED PLANET",
      image: "assets/images/planets/mars.png",
      gravity: "3.711 m/s²",
      lengthOfDay: "1d 0h 37m",
      distanceFromSun: "227.9 million km",
      mass: "6.4171×1023 kg",
      radius: "3389.5 ± 0.2 km",
    ),
    Planet(
        id: 5,
        name: "JUPITER",
        nickName: "THE GAINT PLANET",
        image: "assets/images/planets/jupiter.png",
        distanceFromSun: "778 million km"),
    Planet(
        id: 6,
        name: "SATURN",
        nickName: "THE RINGED PLANET",
        image: "assets/images/planets/saturn.png",
        distanceFromSun: "1,427 million km"),
    Planet(
        id: 7,
        name: "URANUS",
        nickName: "ICE GIANT",
        image: "assets/images/planets/uranus.png",
        distanceFromSun: "2,870 million km"),
    Planet(
        id: 8,
        name: "NEPTUNE",
        nickName: "BIG BLUE PLANET",
        image: "assets/images/planets/neptune.png",
        distanceFromSun: "4,497 million km"),
    Planet(
        id: 9,
        name: "PLUTO",
        nickName: "DWARF PLANET",
        image: "assets/images/planets/pluto.png",
        distanceFromSun: "5,900 million km")
  ];

  @observable
  int selected = 3;

  @action
  setSelected(int value) => this.selected = value;
}
