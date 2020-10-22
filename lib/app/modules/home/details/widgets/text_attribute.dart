import 'package:flutter/material.dart';
import 'package:planets/app/config/theme/colors.dart';

class TextAttribute extends StatelessWidget {
  const TextAttribute({
    Key key,
    @required this.textStyle,
    @required this.description,
    @required this.attribute,
  }) : super(key: key);

  final TextStyle textStyle;
  final String description;
  final String attribute;

  @override
  Widget build(BuildContext context) {
    return RichText(
      // maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(text: '$description: ', style: textStyle, children: [
        TextSpan(
          text: attribute,
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]),
    );
  }
}
