import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neonsignboard/screens/home_screen.dart';
import 'package:neonsignboard/screens/neon_display.dart';
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
      title: 'Flutter Demo',
      theme: themeData(context),
      themeMode: ThemeMode.light,
      home: Home(),
      //home: NeonDisplay(),
    );
  }
}
