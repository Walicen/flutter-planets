import 'package:flutter/material.dart';

class ListItemPlanet extends StatelessWidget {
  final AssetImage image;

  const ListItemPlanet({
    Key key,
    @required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 100,
      child: Center(child: Image(image: image)),
    );
  }
}
