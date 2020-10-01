import 'dart:math';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neonsignboard/constants.dart';
import 'package:neonsignboard/size_config.dart';
import 'theme.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeData(context),
      themeMode: ThemeMode.light,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(orientation == Orientation.landscape
                        // https://www.beiz.jp/download_P/stone/00096.html
                        ? 'assets/images/background_oldbrick_horizontal.jpg'
                        : 'assets/images/background_oldbrick_vertical.png'),
                    fit: BoxFit.fill),
              ),
              child: Center(
                child: NeonTextHighlight(
                  text: 'open',
                  fontSize: 120,
                  fontFamily: 'Neoneon',
                  color: kOrangeColor,
                ),
              ));
        },
      ),
    );
  }
}

class NeonTextHighlight extends StatelessWidget {
  final String text;
  final double fontSize;
  final String fontFamily;
  final Color color;

  NeonTextHighlight({this.text, this.fontSize, this.fontFamily, this.color});

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
