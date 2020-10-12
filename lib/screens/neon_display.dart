import 'package:flutter/material.dart';
import 'package:neonsignboard/constants.dart';
import 'package:neonsignboard/screens/widgets/neon_text.dart';
import 'package:neonsignboard/size_config.dart';

class NeonDisplay extends StatelessWidget {
  final String backGroundHorizontalImage =
      'assets/images/background_oldbrick_horizontal.jpg';
  final String backGroundVerticalImage =
      'assets/images/background_oldbrick_vertical.png';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Stack(children: [
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(orientation == Orientation.landscape
                        // https://www.beiz.jp/download_P/stone/00096.html
                        ? backGroundHorizontalImage
                        : backGroundVerticalImage),
                    fit: BoxFit.fill),
              ),
              child: ColorBar(),
            ),
          ]);
        },
      ),
    );
  }
}

class ColorBar extends StatefulWidget {
  @override
  _ColorBarState createState() => _ColorBarState();
}

class _ColorBarState extends State<ColorBar> {
  int selectedColorIndex = 0;
  Offset _offset =
      Offset(SizeConfig.screenWidth / 2, SizeConfig.screenHeight / 2);

  final List<Color> colors = [
    kOrangeColor,
    kGreenColor,
    kRedColor,
    kBlueColor,
    kYellowColor,
    kPinkColor
  ];

  @override
  Widget build(BuildContext context) {
    // Top bar
    return Container(
      color: Colors.transparent,
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      child: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: colors.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              // Color selector
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColorIndex = index;
                  });
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Colors.white,
                            width: index == selectedColorIndex ? 3 : 1),
                        color: colors[index],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          // Move neon text.
          Positioned(
              left: _offset.dx,
              top: _offset.dy,
              child: GestureDetector(
                onPanUpdate: (details) {
                  setState(() {
                    _offset = Offset(
                      details.delta.dx + _offset.dx,
                      details.delta.dy + _offset.dy,
                    );
                  });
                },
                child: NeonText(
                  text: 'open',
                  fontSize: 120,
                  fontFamily: 'Neoneon',
                  color: colors[selectedColorIndex],
                ),
              )),
        ],
      ),
    );
  }
}
