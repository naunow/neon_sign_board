import 'package:flutter/material.dart';
import 'package:neonsignboard/screens/neon_display.dart';
import 'package:neonsignboard/size_config.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NeonDisplay(),
                  )))
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: OrientationBuilder(builder: (context, orientation) {
        return GridView.builder(
          itemBuilder: (context, index) {
            return Placeholder();
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: orientation == Orientation.landscape ? 3 : 2),
        );
      }),
    );
  }
}
