import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neonsignboard/constants.dart';
import 'package:neonsignboard/screens/home_screen.dart';
import 'theme.dart';

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
      title: 'neon sign board',
      theme: themeData(context),
      themeMode: ThemeMode.light,
      home: Home(),
      //home: NeonDisplay(),
    );
  }
}

class PanTest extends StatefulWidget {
  @override
  _PanTestState createState() => _PanTestState();
}

class _PanTestState extends State<PanTest> {
  Offset _offset = Offset(10, 10);
  double _radians = 0.0; //Scaleの回転値
  double _scale = 1.0; //Scaleのスケール値
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: _offset.dx,
            top: _offset.dy,
            child: GestureDetector(
              // Move a widget on long press.
              // onLongPressMoveUpdate: (details) {
              //   var pointX = details.globalPosition.dx - _offset.dx;
              //   var pointY = details.globalPosition.dy - _offset.dy;
              //   debugPrint('pointX:$pointX pointY:$pointY');
              //   setState(() {
              //     _offset = Offset(
              //       details.globalPosition.dx,
              //       details.globalPosition.dy,
              //     );
              //   });
              // },
              onPanUpdate: (details) {
                setState(() {
                  _offset = Offset(
                    details.delta.dx + _offset.dx,
                    details.delta.dy + _offset.dy,
                  );
                });
              },
              // onScaleUpdate: (scaleDetails) {
              //   setState(() {
              //     _radians = scaleDetails.rotation + scaleDetails.focalPoint.dx;
              //     _scale = scaleDetails.scale + scaleDetails.focalPoint.dy;
              //   });
              // },
              child: Transform.rotate(
                angle: _radians,
                child: Transform.scale(
                  scale: _scale,
                  child: Container(
                    child: Text(
                        'rotation:\n$_radians\nscale:\n$_scale\noffset:${_offset.dx},${_offset.dy}'),
                    width: 300,
                    height: 300,
                    color: kGreenColor,
                  ),
                ),
              ),
            ),
          ),
          // Center(
          //   child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: <Widget>[
          //         GestureDetector(
          //           // 回転とスケールの値を更新
          //           onScaleUpdate: (ScaleUpdateDetails details) {
          //             setState(() {
          //               _radians = details.rotation;
          //               _scale = details.scale;
          //             });
          //           },
          //           child: Transform.rotate(
          //             angle: _radians, // 回転の値
          //             child: Transform.scale(
          //               scale: _scale, // スケールの値
          //               child: Container(
          //                 height: 300,
          //                 width: 300,
          //                 color: Colors.amber,
          //                 child: Center(
          //                   child:
          //                       Text('rotation:\n$_radians\nscale:\n$_scale'),
          //                 ),
          //               ),
          //             ),
          //           ),
          //         )
          //       ]),
          // ),
        ],
      ),
    );
  }
}
