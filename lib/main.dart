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
      home: Transform.rotate(
        angle: 0,
        child: Home(),
      ),
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
                        ? 'assets/images/background_oldbrick_edited.jpg'
                        : 'assets/images/background_oldbrick_edited_vertical.jpg'),
                    fit: BoxFit.fill),
              ),
              child: Center(
                  child: Transform.rotate(
                angle: orientation == Orientation.landscape ? 0 : pi / 2,
                child: NeonTextHighlight(
                  text: 'hello world',
                  fontSize: 80,
                  fontFamily: 'Neoneon',
                  color: kYellowColor,
                ),

                // Transform.rotate(
                //   angle: orientation == Orientation.landscape ? 0 : pi / 2,
                // Center(
                //     child: NeonTextHighlight(
                //   text: 'hello world',
                //   fontSize: 100,
                //   fontFamily: 'Neoneon',
                //   color: kYellowColor,
                // )),
                // ),
              )));
        },
      ),
    );
  }
}

// class MaskedTest extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ShaderMask(
//       child: Text(
//         'HELLO WORLD',
//         style: TextStyle(fontSize: 60),
//       ),
//       shaderCallback: (bounds) {
//         return LinearGradient(
//             colors: [kBlueColor, Colors.white, kBlueColor],
//             stops: [0.0, 0.5, 0.8]).createShader(bounds);
//       },
//       blendMode: BlendMode.srcATop,
//     );
//   }
// }

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
              color: Colors.white70.withOpacity(0.6),
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
                // Shadow(
                //   blurRadius: 120.0,
                //   color: kBlueColor,
                //   offset: Offset(0, 0),
                // ),
                Shadow(
                  blurRadius: 400.0,
                  color: color,
                  offset: Offset(0, 0),
                )
              ]),
        ),
        // Stroked text as border.
        // Text(
        //   text,
        //   style: GoogleFonts.delius.call().copyWith(
        //         fontSize: fontSize,
        //         foreground: Paint()
        //           ..style = PaintingStyle.stroke
        //           ..strokeWidth = 3
        //           ..color = kBlueColor.withOpacity(0.8),
        //       ),
        // ),

        Text(
          text,
          style: TextStyle(
              fontSize: fontSize,
              fontFamily: fontFamily,
              color: Colors.white70.withOpacity(0.6),
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
                // Shadow(
                //   blurRadius: 120.0,
                //   color: kBlueColor,
                //   offset: Offset(0, 0),
                // ),
                Shadow(
                  blurRadius: 400.0,
                  color: color,
                  offset: Offset(0, 0),
                )
              ]),
        ),
        // Solid text as fill.
        // Text(
        //   text,
        //   style: GoogleFonts.delius.call().copyWith(
        //       fontSize: fontSize,
        //       color: Colors.white70.withOpacity(0.6),
        //       shadows: [
        //         Shadow(
        //           blurRadius: 10.0,
        //           color: kBlueColor,
        //           offset: Offset(0, 0),
        //         ),
        //         Shadow(
        //           blurRadius: 80.0,
        //           color: kBlueColor,
        //           offset: Offset(0, 0),
        //         ),
        //         // Shadow(
        //         //   blurRadius: 120.0,
        //         //   color: kBlueColor,
        //         //   offset: Offset(0, 0),
        //         // ),
        //         Shadow(
        //           blurRadius: 400.0,
        //           color: kBlueColor,
        //           offset: Offset(0, 0),
        //         )
        //       ]),
        // ),
      ],
    );
  }
}

class NeonText extends StatelessWidget {
  const NeonText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Hello World',
      style: TextStyle(
          fontFamily: 'Electronic',
          fontSize: 60,
          color: kBlueColor,
          shadows: [
            Shadow(
              blurRadius: 10.0,
              color: kBlueColor,
              offset: Offset(0, 0),
            ),
            Shadow(
              blurRadius: 40.0,
              color: kBlueColor,
              offset: Offset(0, 0),
            ),
            Shadow(
              blurRadius: 100.0,
              color: kBlueColor,
              offset: Offset(0, 0),
            )
          ]),
    );
  }
}
