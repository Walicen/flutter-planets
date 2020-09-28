import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:planets/app/config/theme/colors.dart';
import 'package:planets/app/shared/widgets/fade_animation.dart';
import 'package:planets/app/shared/widgets/opacity_animation.dart';

import 'splash_screen_controller.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends ModularState<SplashScreenPage, SplashScreenController> {
  //use 'controller' variable to access controller

  loadImage() async{
    precacheImage(AssetImage('assets/images/planets/venus.png'), context);
    precacheImage(AssetImage('assets/images/planets/mercury.png'), context);
    precacheImage(AssetImage('assets/images/planets/earth.png'), context);
    // await precacheImage(AssetImage('assets/images/planets/mars.png'), context);
    precacheImage(AssetImage('assets/images/planets/saturn.png'), context);
    precacheImage(AssetImage('assets/images/planets/uranus.png'), context);
    precacheImage(AssetImage('assets/images/planets/neptune.png'), context);
    precacheImage(AssetImage('assets/images/planets/jupiter.png'), context);
    precacheImage(AssetImage('assets/images/planets/pluto.png'), context);
  }

  @override
  void initState() {

    Future.delayed(Duration(seconds: 3)).whenComplete(() => Modular.to.pushNamed('/home'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    loadImage();
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeAnimation(
            delay: 1,
            child: Container(
              padding: EdgeInsets.all(50),
              child: Image.asset('assets/images/planets/mars.png'),
            ),
          ),
          FadeAnimation(
              delay: 2.2,
              child: Text(
                'PLANETS',
                style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
                textScaleFactor: 2.2,
              )),
          OpacityAnimation(
            delay: 3,
            child: Container(
              width: 130,
              child: LinearProgressIndicator(
                minHeight: 2,
                backgroundColor: secondaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
