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
        lengthOfDay: "58d 15h 30m",
        distanceFromSun: "58 million km",
        radius: "2,439.7 km",
        mass: "3.3011×1023 kg",
        tiltOfAxis: "2.04′ ± 0.08",
        gravity: "3.7 m/s2",
        surfacePressure: "≲ 0.5 nPa",
        temperature: "427 °C"
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
        distanceFromSun: "150 million km",
        radius: "6,371 km",
        age: "4.543 billion years",
        mass: "5.97237×1024 kg"),
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
        distanceFromSun: "778 million km",
        mass: "1.898 × 10^27 kg",
        radius: "69,911 km",
        moons:
        'Adrastea, Aitne, Amalthea, Ananke, Aoede, Arche, Autonoe, Callirrhoe, Callisto, Carme, Carpo, Chaldene, Cyllene, Dia, Eirene, Elara, Erinome, Ersa, Euanthe, Eukelade, Eupheme, Euporie, Europa, Eurydome, Ganymede, Harpalyke, Hegemone, Helike, Hermippe, Herse, Himalia, Io, Iocaste, Isonoe, Jupiter LI, Jupiter LII, Kale, Kallichore, Kalyke, Kore, Leda, Lysithea, Megaclite, Metis, Mneme, Orthosie, Pandia, Pasiphae, Pasithee, Philophrosyne, Praxidike, Sinope, Sponde, Taygete, Thebe, Thelxinoe, Themisto, Thyone'),
    Planet(
      id: 6,
      name: "SATURN",
      radius: "58,232 km",
      gravity: "10.44 m/s²",
      lengthOfDay: "0d 10h 42m",
      nickName: "THE RINGED PLANET",
      image: "assets/images/planets/saturn.png",
      distanceFromSun: "1,427 billion km",
      mass: "5.6834×1026 kg",
      tiltOfAxis: "26.73°",
      moons:
      'Aegaeon, Aegir, Albiorix, Anthe, Atlas, Bebhionn, Bergelmir, Bestla, Calypso, Daphnis, Dione, Enceladus, Epimetheus, Erriapus, Farbauti, Fenrir, Fornjot, Greip, Hati, Helene, Hyperion, Hyrrokkin, Iapetus, Ijiraq, Janus, Jarnsaxa, Kari, Kiviuq, Loge, Methone, Mimas, Mundilfari, Narvi, Paaliaq, Pallene, Pan, Pandora, Phoebe, Polydeuces, Prometheus, Rhea, S/2004 S12, S/2004 S13, S/2004 S17, S/2004 S20, S/2004 S21, S/2004 S22, S/2004 S23, S/2004 S24, S/2004 S25, S/2004 S26, S/2004 S27, S/2004 S28, S/2004 S29, S/2004 S30, S/2004 S7, S/2004 XXX (S5593a2), S/2004 XXX (S5605a2), S/2004 XXX (S5613a2), S/2004 XXX (S5801a2), S/2004 XXX (S64454x), S/2004 XXX (S64472), S/2004 XXX (S8568a), S/2004 XXX (T514042), S/2004 XXX (T522499), S/2006 S1, S/2006 S3, S/2007 S2, S/2007 S3, S/2009 S1, Siarnaq, Skathi, Skoll, Surtur, Suttungr, Tarqeq, Tarvos, Telesto, Tethys, Thrymr, Titan, Ymir',
    ),
    Planet(
      id: 7,
      name: "URANUS",
      nickName: "ICE GIANT",
      image: "assets/images/planets/uranus.png",
      distanceFromSun: "2.871 billion km",
      radius: "25,362 km",
      mass: "8.681 × 10^25 kg",
      gravity: "8.87 m/s²",
      lengthOfDay: "0d 17h 14m",
      tiltOfAxis: "97.77º",
      temperature: "−197.2 °C",
      moons: 'Cordelia Ophelia, Bianca, Cressida, Desdemona, Juliet, Portia, Rosalind, Cupid, Belinda, Perdita, Puck, Mab, Miranda, Ariel, Umbriel, Titania, Oberon, Francisco, Caliban, Stephano, Trinculo, Sycorax, Margaret, Prospero, Setebos, Ferdinand',
    ),
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
