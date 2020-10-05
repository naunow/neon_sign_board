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
          bool showMenu = false;
          return InkWell(
            onTap: () {
              showMenu ? showMenu = false : showMenu = true;
              debugPrint(showMenu.toString());
            },
            child: Container(
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
                child: Center(
                  child: NeonText(
                    text: 'open',
                    fontSize: 120,
                    fontFamily: 'Neoneon',
                    color: kOrangeColor,
                  ),
                )),
          );
        },
      ),
    );
  }
}
