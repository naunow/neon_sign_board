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
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Text(
                    'Color',
                    style: TextStyle(
                        color: colors[index],
                        fontSize: 30,
                        fontWeight: index == selectedColorIndex
                            ? FontWeight.bold
                            : FontWeight.normal,
                        fontFamily: 'Neoneon'),
                  ),
                ),
              );
            },
          ),
          Center(
            child: NeonText(
              text: 'open',
              fontSize: 120,
              fontFamily: 'Neoneon',
              color: colors[selectedColorIndex],
            ),
          )
        ],
      ),
    );
  }
}
