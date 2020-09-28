import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planets/app/config/theme/colors.dart';

class AppBarCustom extends StatelessWidget {
  final bool invertedColor;
  final String leftText;

  const AppBarCustom({
    Key key,
    this.invertedColor = false,
    this.leftText = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            padding: EdgeInsets.all(10),
            child: Text(
              leftText,
              style: TextStyle(fontWeight: FontWeight.w800),
              textScaleFactor: 1.5,
            )),
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: invertedColor ? secondaryColor : primaryColor,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16)),
          ),
          child: Icon(Icons.apps, color: invertedColor ? primaryColor : secondaryColor),
        )
      ],
    );
  }
}
