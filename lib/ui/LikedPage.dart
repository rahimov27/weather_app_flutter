import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_project/ui/common_widgets/my_cities_widget.dart';
import 'dart:convert';

class CitiesScreen extends StatefulWidget {
  const CitiesScreen({super.key});

  @override
  State<CitiesScreen> createState() => _CitiesScreenState();
}

class _CitiesScreenState extends State<CitiesScreen>
    with WidgetsBindingObserver {
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

  // For adding city
  String favoriteCity = '';
  TextEditingController cityController = TextEditingController();

  // List to store added cities' weather data
  List<Map<String, String>> citiesWeather = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    getData();
    loadCitiesFromCache();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadCitiesFromCache();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      loadCitiesFromCache();
    }
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
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Center(
                    child: Column(
                      children: [
                        TextField(
                          controller: cityController,
                          decoration: const InputDecoration(
                              hintText: 'Please enter city name'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.close),
                            ),
                            IconButton(
                              onPressed: () async {
                                await addCity();
                                cityController.clear();
                                Navigator.pop(context); // Close the dialog
                                setState(() {});
                              },
                              icon: const Icon(Icons.search),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.add,
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
              GestureDetector(
                onDoubleTap: () => removeCity('Moscow'),
                child: MyCitiesWidget(
                  cityName: cityMoscow,
                  weatherTemp: tempMoscow,
                ),
              ),
              const SizedBox(
                height: 37,
              ),
              GestureDetector(
                onDoubleTap: () => removeCity('Berlin'),
                child: MyCitiesWidget(
                  cityName: cityBerlin,
                  weatherTemp: tempBerlin,
                ),
              ),
              const SizedBox(
                height: 37,
              ),
              GestureDetector(
                onDoubleTap: () => removeCity('Bishkek'),
                child: MyCitiesWidget(
                  cityName: cityBishkek,
                  weatherTemp: tempBishkek,
                ),
              ),
              const SizedBox(
                height: 37,
              ),
              GestureDetector(
                onDoubleTap: () => removeCity('Kiev'),
                child: MyCitiesWidget(
                  cityName: cityKiev,
                  weatherTemp: tempKiev,
                ),
              ),
              const SizedBox(
                height: 37,
              ),
              GestureDetector(
                onDoubleTap: () => removeCity('Potsdam'),
                child: MyCitiesWidget(
                  cityName: cityPotsdam,
                  weatherTemp: tempPotsdam,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ...citiesWeather.map(
                (city) {
                  return Column(
                    children: [
                      GestureDetector(
                        onDoubleTap: () => removeCity(city['cityName']!),
                        child: MyCitiesWidget(
                          cityName: city['cityName']!,
                          weatherTemp: city['temp']!,
                        ),
                      ),
                      const SizedBox(height: 37),
                    ],
                  );
                },
              ).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addCity() async {
    final dio = Dio();
    final response = await dio.get(
        'https://api.openweathermap.org/geo/1.0/direct?q=${cityController.text}&limit=5&appid=e4c7d413beed7d8cc6521ae67ca4d8f0');
    if (response.data.isNotEmpty) {
      final cityData = response.data[0];
      final cityName = cityData["name"];
      final lat = cityData["lat"].toString();
      final lon = cityData["lon"].toString();

      final weatherResponse = await dio.get(
          "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=e4c7d413beed7d8cc6521ae67ca4d8f0&units=metric");
      final temp = weatherResponse.data["main"]["temp"].toString();

      setState(() {
        favoriteCity = cityName;
        citiesWeather.add({
          'cityName': cityName,
          'temp': temp,
        });
        saveCitiesToCache();
      });
    }
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

  void removeCity(String cityName) {
    setState(() {
      citiesWeather.removeWhere((city) => city['cityName'] == cityName);
      saveCitiesToCache();
    });
  }

  Future<void> saveCitiesToCache() async {
    final prefs = await SharedPreferences.getInstance();
    final citiesWeatherString = jsonEncode(citiesWeather);
    await prefs.setString('citiesWeather', citiesWeatherString);
  }

  Future<void> loadCitiesFromCache() async {
    final prefs = await SharedPreferences.getInstance();
    final citiesWeatherString = prefs.getString('citiesWeather');
    if (citiesWeatherString != null) {
      setState(() {
        citiesWeather = List<Map<String, String>>.from(
          jsonDecode(citiesWeatherString),
        );
      });
    }
  }
}
