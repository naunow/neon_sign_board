import 'package:flutter/material.dart';

class NeonText extends StatelessWidget {
  final String text;
  final double fontSize;
  final String fontFamily;
  final Color color;

  NeonText({this.text, this.fontSize, this.fontFamily, this.color});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
              fontFamily: fontFamily,
              fontSize: fontSize,
              color: Colors.white70.withOpacity(0.7),
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: color,
                  offset: Offset(0, 0),
                ),
                Shadow(
                  blurRadius: 80.0,
                  color: color,
                  offset: Offset(0, 0),
                ),
                Shadow(
                  blurRadius: 300.0,
                  color: color,
                  offset: Offset(0, 0),
                ),
                Shadow(
                  blurRadius: 500.0,
                  color: color,
                  offset: Offset(0, 0),
                )
              ]),
        ),
        //Stroked text as border.
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: fontFamily,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 3
              ..color = color.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
