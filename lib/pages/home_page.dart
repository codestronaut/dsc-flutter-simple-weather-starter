import 'package:flutter/material.dart';
import 'package:flutter_simple_weather/data/controllers/weather_controller.dart';
import 'package:flutter_simple_weather/data/models/weather.dart';
import 'package:flutter_simple_weather/pages/loading_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherController weatherController = Get.find();
  Rx<Weather> weather = Weather().obs;

  @override
  void initState() {
    super.initState();
    weather = weatherController.weather;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            'Weather',
            style: GoogleFonts.poppins(
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(
            16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My Location',
                      style: GoogleFonts.poppins(
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      weather().city,
                      style: GoogleFonts.poppins(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 32.0,
              ),
              Container(
                child: Image(
                  image: AssetImage(
                    weatherController.getWeatherImage(weather().id),
                  ),
                  width: 300.0,
                ),
              ),
              SizedBox(
                height: 32.0,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Temperature',
                      style: GoogleFonts.poppins(
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      '${weather().temperature}ºC',
                      style: GoogleFonts.poppins(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Wind',
                      style: GoogleFonts.poppins(
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      '${weather().wind} Km/h',
                      style: GoogleFonts.poppins(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Humidity',
                      style: GoogleFonts.poppins(
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      '${weather().humidity} %',
                      style: GoogleFonts.poppins(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF7FBDCA),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoadingPage(),
              ),
            );
          },
          child: Icon(
            Icons.navigation_rounded,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
