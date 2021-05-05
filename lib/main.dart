import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_simple_weather/pages/home_page.dart';
import 'package:flutter_simple_weather/pages/loading_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Set statusbar to light
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
    );

    return MaterialApp(
      title: 'Simple Weather',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      home: LoadingPage(),
    );
  }
}
