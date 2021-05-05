import 'dart:async';

import 'package:flutter_simple_weather/data/helper/network_helper.dart';
import 'package:flutter_simple_weather/data/models/weather.dart';
import 'package:get/get.dart';

class WeatherController {
  Rx<Weather> weather = Weather().obs;

  Future<dynamic> getCurrentWeather(double lat, double lon) async {
    try {
      NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=cc95d932d5a45d33a9527d5019475f2c&units=metric',
      );

      var weatherData = await networkHelper.getData();
      weather = Weather.fromJson(weatherData).obs;
    } on TimeoutException catch (_) {
      throw ("No respond after 20 seconds");
    } catch (e) {
      throw ("Failed to fetch API");
    }
  }

  String getWeatherImage(int condition) {
    if (condition < 300) {
      // thunderstorm
      return 'assets/thunderstorm.png';
    } else if (condition < 400) {
      // drizzle
      return 'assets/drizzle.png';
    } else if (condition < 600) {
      // rain
      return 'assets/rain.png';
    } else if (condition < 700) {
      // snow
      return 'assets/snow.png';
    } else if (condition < 800) {
      // clear
      return 'assets/clear.png';
    } else if (condition < 804) {
      // cloudy
      return 'assets/cloudy.png';
    } else {
      return 'assets/stars.png';
    }
  }
}

// Example
/*
try {
  NetworkHelper networkHelper = NetworkHelper(
    url: UrlList.userData,
    headers: {'Authorization': 'Bearer $token'},
  );

  var profileData = await networkHelper.getData();
  profile = Profile.fromJson(profileData).obs;
} on TimeoutException catch (_) {
  // Implement 404 page later
  throw ("No respond after 20 seconds");
} catch (e) {
  // Implement 404 page later
  throw ("Failed to fetch API");
}
*/