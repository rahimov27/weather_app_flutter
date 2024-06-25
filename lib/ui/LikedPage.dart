import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_project/resources/resources.dart';
import 'package:weather_app_project/ui/common_widgets/my_cities_widget.dart';

class CitiesScreen extends StatefulWidget {
  const CitiesScreen({super.key});

  @override
  State<CitiesScreen> createState() => _CitiesScreenState();
}

class _CitiesScreenState extends State<CitiesScreen> {
  String cityMoscow = '';
  String tempMoscow = '';
  String moscowLat = "55.751244";
  String moscowLon = "37.618423";

  String cityBishkek = '';
  String tempBishkek = '';
  String bishkekLat = "42.882004";
  String bishkekLon = "74.582748";

  String cityBerlin = '';
  String tempBerlin = '';
  String berlinLat = "52.520008";
  String berlinLon = "13.404954";

  String cityKiev = '';
  String tempKiev = '';
  String kievlat = "50.450001";
  String kievlon = "30.523333";

  String cityPotsdam = '';
  String tempPotsdam = '';
  String potsdamlat = "52.391842";
  String potsdamlon = "13.063561";

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191919),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Cities screen",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff191919),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 24,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 37,
              ),
              MyCitiesWidget(
                cityName: cityMoscow,
                weatherTemp: tempMoscow,
                weatherImage: Images.dayWind,
              ),
              const SizedBox(
                height: 37,
              ),
              MyCitiesWidget(
                cityName: cityBerlin,
                weatherTemp: tempBerlin,
                weatherImage: Images.dayWind,
              ),
              const SizedBox(
                height: 37,
              ),
              MyCitiesWidget(
                cityName: cityBishkek,
                weatherTemp: tempBishkek,
                weatherImage: Images.dayWind,
              ),
              const SizedBox(
                height: 37,
              ),
              MyCitiesWidget(
                cityName: cityKiev,
                weatherTemp: tempKiev,
                weatherImage: Images.dayWind,
              ),
              const SizedBox(
                height: 37,
              ),
              MyCitiesWidget(
                cityName: cityPotsdam,
                weatherTemp: tempPotsdam,
                weatherImage: Images.dayWind,
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getData() async {
    final Dio dio = Dio();
    final Response responseMoscow = await dio.get(
        "https://api.openweathermap.org/data/2.5/weather?lat=$moscowLat&lon=$moscowLon&appid=e4c7d413beed7d8cc6521ae67ca4d8f0&units=metric");
    final Response responseBishkek = await dio.get(
        "https://api.openweathermap.org/data/2.5/weather?lat=$bishkekLat&lon=$bishkekLon&appid=e4c7d413beed7d8cc6521ae67ca4d8f0&units=metric");
    final Response responseBerlin = await dio.get(
        "https://api.openweathermap.org/data/2.5/weather?lat=$berlinLat&lon=$berlinLon&appid=e4c7d413beed7d8cc6521ae67ca4d8f0&units=metric");
    final Response responseKiev = await dio.get(
        "https://api.openweathermap.org/data/2.5/weather?lat=$kievlat&lon=$kievlon&appid=e4c7d413beed7d8cc6521ae67ca4d8f0&units=metric");
    final Response responsePotsdam = await dio.get(
        "https://api.openweathermap.org/data/2.5/weather?lat=$potsdamlat&lon=$potsdamlon&appid=e4c7d413beed7d8cc6521ae67ca4d8f0&units=metric");

    setState(() {});

    // Cities
    cityMoscow = responseMoscow.data["name"].toString();
    tempMoscow = responseMoscow.data["main"]["temp"].toString();

    cityBishkek = responseBishkek.data["name"].toString();
    tempBishkek = responseBishkek.data["main"]["temp"].toString();

    cityBerlin = responseBerlin.data["name"].toString();
    tempBerlin = responseBerlin.data["main"]["temp"].toString();

    cityKiev = responseKiev.data["name"].toString();
    tempKiev = responseKiev.data["main"]["temp"].toString();

    cityPotsdam = responsePotsdam.data["name"].toString();
    tempPotsdam = responsePotsdam.data["main"]["temp"].toString();
  }
}
