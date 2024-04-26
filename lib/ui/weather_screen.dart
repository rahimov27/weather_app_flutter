import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_project/core/app_fonts.dart';
import 'package:weather_app_project/resources/resources.dart';
import 'package:weather_app_project/ui/common_widgets/my_container.dart';
import 'package:weather_app_project/ui/common_widgets/my_row_widget.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String city = '';
  String temp = '';
  double wind = 0;
  String countryCode = '';
  double real_feels = 0;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    // Format the current time as "hour:minute"
    String formattedTime = DateFormat.Hm().format(now);

    return Scaffold(
      backgroundColor: const Color(0xff191919),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "$city, $countryCode",
          style: AppFonts.s16regular.copyWith(color: Colors.white),
        ),
        backgroundColor: const Color(0xff292929),
        actions: [
          IconButton(
            onPressed: () async {
              // print(currentPosition.latitude);
              // print(currentPosition.longitude);
              getData();
            },
            icon: const Icon(
              Icons.add_location_alt_sharp,
              size: 24,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Column(
            children: [
              Text(
                city,
                style: AppFonts.s32bold.copyWith(color: Colors.white),
              ),
              Text(
                formattedTime,
                style: AppFonts.s16regular.copyWith(color: Colors.white),
              ),
              Stack(
                children: [
                  Text(
                    temp,
                    style: const TextStyle(
                      fontSize: 100,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 80),
                    child: Image(
                      image: AssetImage(Images.dayWind),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyContainer(
                    typeWeather: 'Wind',
                    temp: wind.toString(),
                    image: Images.hazzy,
                  ),
                  const MyContainer(
                    typeWeather: 'Chance of Rain',
                    temp: "",
                    image: Images.stormyDay,
                  ),
                  MyContainer(
                    typeWeather: 'Real feel',
                    temp: real_feels.toString(),
                    image: Images.sunny,
                  ),
                ],
              ),
              const SizedBox(height: 38),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyRowWidget(
                      temp: "26",
                      typeOfWeather: "Row",
                      image: Images.hazzy,
                    ),
                    MyRowWidget(
                      temp: "22",
                      typeOfWeather: "Row",
                      image: Images.hazzy,
                    ),
                    MyRowWidget(
                      temp: "1",
                      typeOfWeather: "Row",
                      image: Images.hazzy,
                    ),
                    MyRowWidget(
                      temp: "15",
                      typeOfWeather: "Row",
                      image: Images.hazzy,
                    ),
                    MyRowWidget(
                      temp: "16",
                      typeOfWeather: "Row",
                      image: Images.hazzy,
                    ),
                    MyRowWidget(
                      temp: "22",
                      typeOfWeather: "Row",
                      image: Images.hazzy,
                    ),
                    MyRowWidget(
                      temp: "32",
                      typeOfWeather: "Row",
                      image: Images.hazzy,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getData() async {
    final Dio dio = Dio();
    final currentLocation = await _determinePosition();
    final Response response = await dio.get(
        "https://api.openweathermap.org/data/2.5/weather?lat=${currentLocation.latitude}&lon=${currentLocation.longitude}&appid=e4c7d413beed7d8cc6521ae67ca4d8f0&units=metric");
    city = response.data["name"];
    temp = response.data["main"]["temp"].toString();
    wind = response.data["wind"]["speed"];
    countryCode = response.data["sys"]["country"];
    real_feels = response.data["main"]["feels_like"];
    setState(() {});
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
