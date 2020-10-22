import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:planets/app/config/theme/colors.dart';
import 'package:planets/app/models/planets_model.dart';
import 'package:planets/app/shared/app_bar_custom.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            AppBarCustom(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'PLANETS',
                  style: TextStyle(color: primaryColor, letterSpacing: 5, fontWeight: FontWeight.bold),
                  textScaleFactor: 1.5,
                )
              ],
            ),
            Expanded(
                child: Observer(
              builder: (ctx) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ...controller.planets.asMap().entries.map((item) {
                    if (item.key == controller.selected) {
                      return SelectedItem(
                        planet: item.value,
                      );
                    }
                    return UnselectedItem(
                      planet: item.value.name,
                      onTap: () {
                        controller.setSelected(item.key);
                      },
                    );
                  }).toList()
                ],
              ),
            )),
            // Container(
            //   child: FloatingActionButton(
            //       child: Icon(Icons.add),
            //       foregroundColor: secondaryColor,
            //       backgroundColor: primaryColor,
            //       onPressed: () {
            //         print('Connect Tap Button');
            //       }),
            // )
          ],
        ),
      ),
    );
  }
}

class UnselectedItem extends StatelessWidget {
  final String planet;
  final Function onTap;

  const UnselectedItem({Key key, this.planet, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        height: 40,
        width: sizeScreen,
        padding: EdgeInsets.only(left: sizeScreen * 0.2),
        child: Text(
          planet,
          style: TextStyle(color: primaryColor, fontWeight: FontWeight.w500, letterSpacing: 2),
        ),
      ),
    );
  }
}

class SelectedItem extends StatelessWidget {
  final Planet planet;

  const SelectedItem({Key key, this.planet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Positioned(
          top: (height * 0.09) / 2,
          right: 0,
          child: Container(
            width: width * 0.1,
            height: 2,
            color: primaryColor,
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20, left: width * 0.1, right: width * 0.1),
          padding: EdgeInsets.only(left: 15, right: 15),
          height: height * 0.09,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: primaryColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(planet.name,
                  style: TextStyle(color: primaryColor, letterSpacing: 7, fontWeight: FontWeight.bold),
                  textScaleFactor: 1.8),
              InkWell(
                  splashColor: primaryColor,
                  borderRadius: BorderRadius.circular(180),
                  onTap: () {
                    debugPrint('Clicou na imagem');
                    Modular.to.pushNamed('/home/details', arguments: planet);
                  },
                  child: Container(padding: EdgeInsets.all(8), child: Image.asset(planet.image))),
            ],
          ),
        ),
      ],
    );
  }
}
