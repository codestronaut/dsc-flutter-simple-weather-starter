import 'package:flutter/material.dart';
import 'package:flutter_simple_weather/data/controllers/weather_controller.dart';
import 'package:flutter_simple_weather/data/models/location.dart';
import 'package:flutter_simple_weather/pages/home_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage({Key key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  WeatherController weatherController = Get.put(WeatherController());
  Location location = Location();

  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  getWeatherData() async {
    await location.getCurrentLocation();
    await weatherController.getCurrentWeather(
        location.latitude, location.longitude);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Color(0xFF7FBDCA),
        ),
      ),
    );
  }
}
