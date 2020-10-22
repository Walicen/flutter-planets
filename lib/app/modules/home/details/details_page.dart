import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:planets/app/config/theme/colors.dart';
import 'package:planets/app/models/planets_model.dart';
import 'package:planets/app/modules/home/home_controller.dart';
import 'package:planets/app/shared/app_bar_custom.dart';
import 'package:planets/app/shared/widgets/fade_animation.dart';

import 'details_controller.dart';
import 'widgets/list_item_planet.dart';
import 'widgets/rouded_clipper.dart';
import 'widgets/text_attribute.dart';

class DetailsPage extends StatefulWidget {
  final String title;
  Planet planet;

  DetailsPage({Key key, this.title = "Details", this.planet}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends ModularState<DetailsPage, DetailsController> with SingleTickerProviderStateMixin {
  FixedExtentScrollController _scrollController;

  @override
  void initState() {
    _scrollController = FixedExtentScrollController(initialItem: widget.planet.id - 1);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final planet = widget.planet;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    const textStyle = TextStyle(color: tertiaryColor, fontWeight: FontWeight.w300);

    final HomeController homeController = Modular.get<HomeController>();

    return Scaffold(
      backgroundColor: secondaryColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                ClipPath(
                  child: Container(
                    width: double.infinity,
                    height: height * 0.6,
                    color: primaryColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            FadeAnimation(
                              delay: 1.5,
                              child: Text(
                                planet.name,
                                style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 5, fontSize: 25),
                              ),
                            ),
                            FadeAnimation(
                              delay: 0.8,
                              child: Text(
                                planet.nickName,
                                style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 5, fontSize: 35),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: Image.asset(
                            planet.image,
                            width: width * 0.6,
                            height: width * 0.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  clipper: RoundedClipper(),
                ),
                AppBarCustom(
                  invertedColor: true,
                  leftText: "#${planet.id}",
                ),
              ],
            ),
            Container(
              height: height * 0.365,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextAttribute(
                                  textStyle: textStyle,
                                  attribute: planet.distanceFromSun ?? '',
                                  description: 'Distance from Sun'),
                              TextAttribute(
                                  textStyle: textStyle, attribute: planet.radius ?? '', description: "Radius"),
                              TextAttribute(textStyle: textStyle, attribute: planet.moons ?? '', description: "Moons"),
                              TextAttribute(
                                  textStyle: textStyle, attribute: planet.gravity ?? '', description: "Gravity"),
                              TextAttribute(
                                  textStyle: textStyle,
                                  attribute: planet.tiltOfAxis ?? '',
                                  description: "Tilt of Axis"),
                              TextAttribute(
                                  textStyle: textStyle,
                                  attribute: planet.lengthOfYear ?? '',
                                  description: "Length of Year"),
                              TextAttribute(
                                  textStyle: textStyle,
                                  attribute: planet.lengthOfDay ?? '',
                                  description: "Length of Day"),
                              TextAttribute(
                                  textStyle: textStyle,
                                  attribute: planet.temperature ?? '',
                                  description: "Temperature"),
                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 25),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: primaryColor),
                            ),
                            child: Icon(
                              Icons.more_horiz,
                              color: primaryColor,
                            ))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'DISCOVER',
                          style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
                          textScaleFactor: 1.1,
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 250,
                              child: ListWheelScrollView(
                                controller: _scrollController,
                                physics: const FixedExtentScrollPhysics(),
                                useMagnifier: true,
                                overAndUnderCenterOpacity: 0.5,
                                diameterRatio: 3.0,
                                onSelectedItemChanged: (index) {
                                  setState(() {
                                    widget.planet = homeController.planets[index];
                                  });
                                },
                                squeeze: 0.9,
                                itemExtent: 80.0,
                                children: List.generate(homeController.planets.length, (index) {
                                  return ListItemPlanet(
                                    image: AssetImage(homeController.planets[index].image),
                                  );
                                }),
                              ),
                            ),
                            Positioned(
                              top: 87,
                              left: 12,
                              child: IgnorePointer(
                                ignoring: true,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    RotatedBox(
                                        quarterTurns: 3,
                                        child: Text(
                                          widget.planet.name,
                                          style: TextStyle(color: tertiaryColor, letterSpacing: 4),
                                          textScaleFactor: 0.8,
                                        )),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Container(
                                      width: 87,
                                      height: 87,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: tertiaryColor),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                    Container(
                                      height: 2,
                                      width: 25,
                                      color: tertiaryColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}