import 'package:flutter/material.dart';
import 'package:neonsignboard/screens/neon_display.dart';
import 'package:neonsignboard/size_config.dart';

// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Scaffold(
//       appBar: AppBar(
//         actions: <Widget>[
//           IconButton(
//               icon: Icon(Icons.add),
//               onPressed: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => NeonDisplay(),
//                   )))
//         ],
//       ),
//       resizeToAvoidBottomInset: false,
//       body: OrientationBuilder(builder: (context, orientation) {
//         return GridView.builder(
//           itemBuilder: (context, index) {
//             return Placeholder();
//           },
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: orientation == Orientation.landscape ? 3 : 2),
//         );
//       }),
//     );
//   }
// }

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            snap: false,
            floating: false,
            title: Text('App Bar'),
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
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: SizeConfig.screenWidth / 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 3.0,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              return OrientationBuilder(builder: (context, orientation) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('grid item $index'),
                );
              });
            }, childCount: 50),
          ),
        ],
      ),
    );
  }
}
