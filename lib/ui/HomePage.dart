import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_project/core/app_fonts.dart';
import 'package:weather_app_project/resources/resources.dart';
import 'package:weather_app_project/ui/common_widgets/my_container.dart';
import 'package:weather_app_project/ui/common_widgets/my_daily_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String city = '';
  String temp = '';
  double wind = 0;
  String countryCode = '';
  double real_feels = 0;
  String visibility = '';
  String feels_like = '';
  String temp_min = '';
  String temp_max = '';
  String pressure = '';
  String sea_level = '';
  String grnd_level = '';
  String humidity = '';
  String temp_kf = '';
  String image_icon = '';

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
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
              getData();
              setState(() {});
            },
            icon: const Icon(
              Icons.add_location_alt_sharp,
              size: 24,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          var isPortrait = constraints.maxHeight > constraints.maxWidth;
          double circleAvatarRadius = constraints.maxWidth * 0.08;
          double bottomContainerHeight = constraints.maxHeight * 0.75;
          double imageSize = constraints.maxWidth * 0.5;
          double titleFontSize = constraints.maxWidth * 0.08;
          double subtitleFontSize = constraints.maxWidth * 0.04;

          return Padding(
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
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [Colors.white, Color.fromARGB(0, 0, 0, 0)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.7, 1.0],
                        ).createShader(bounds),
                        child: Text(
                          temp,
                          style: TextStyle(
                            fontSize: constraints.maxWidth * 0.35,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'ReemKufi',
                          ),
                        ),
                      ),
                      if (image_icon.isNotEmpty)
                        Positioned(
                          top: constraints.maxHeight * 0.20,
                          child: Image.network(
                            'http://openweathermap.org/img/wn/$image_icon@2x.png',
                            width: constraints.maxWidth * 0.4,
                            height: constraints.maxWidth * 0.4,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.error, color: Colors.red);
                            },
                          ),
                        ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyContainer(
                      typeWeather: 'Wind',
                      temp: wind.toString(),
                      image: Images.hazzy,
                    ),
                    MyContainer(
                      typeWeather: 'Visibility',
                      temp: visibility,
                      image: Images.stormyDay,
                    ),
                    MyContainer(
                      typeWeather: 'Real feel',
                      temp: real_feels.toString(),
                      image: Images.sunny,
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyDailyWidget(
                        day: "Temp max",
                        temp: temp_max,
                        imagePath: 'assets/icons_svg/temp-max.svg',
                      ),
                      MyDailyWidget(
                        day: "Temp min",
                        temp: temp_min,
                        imagePath: 'assets/icons_svg/temp-min.svg',
                      ),
                      MyDailyWidget(
                        day: "Pressure",
                        temp: pressure,
                        imagePath: 'assets/icons_svg/pressure.svg',
                      ),
                      MyDailyWidget(
                        day: "Humidity",
                        temp: humidity,
                        imagePath: 'assets/icons_svg/humidity.svg',
                      ),
                      MyDailyWidget(
                        day: "Grnd level",
                        temp: grnd_level,
                        imagePath: 'assets/icons_svg/grnd-level.svg',
                      ),
                      MyDailyWidget(
                        day: "Sea level",
                        temp: sea_level,
                        imagePath: 'assets/icons_svg/sea-level.svg',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
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
    visibility = response.data["visibility"].toString();
    feels_like = response.data['main']['feels_like'].toString();
    temp_min = response.data['main']['temp_min'].toString();
    temp_max = response.data['main']['temp_max'].toString();
    pressure = response.data['main']['pressure'].toString();
    sea_level = response.data['main']['sea_level'].toString();
    grnd_level = response.data['main']['grnd_level'].toString();
    humidity = response.data['main']['humidity'].toString();
    temp_kf = response.data['main']['temp_kf'].toString();
    image_icon = response.data['weather'][0]['icon'].toString();

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
