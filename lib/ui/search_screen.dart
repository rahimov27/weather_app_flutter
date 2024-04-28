import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();
  String cityLat = '';
  String cityLon = '';

  double weatherTemp = 0;
  String cityName = '';
  double windSpeed = 0;

  String bgImage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Air pollution"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "Enter city name",
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      getData();
                      findImage();
                      controller.text = '';
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                weatherTemp.toString(),
                style: const TextStyle(fontSize: 40),
              ),
              Text(
                cityName,
                style: const TextStyle(fontSize: 40),
              ),
              Text(
                "Wind speed $windSpeed",
                style: const TextStyle(fontSize: 40),
              ),
              Image.network("$bgImage")
            ],
          ),
        ),
      ),
    );
  }

  Future<void> findImage() async {
    final dio = Dio();
    final imageResponse = await dio.get(
        "https://api.unsplash.com/search/photos?query=${controller.text}&client_id=pDwlc8evJ9bxPFLNW7uWhbpSRmxxtLHdnEN0Nr0L94Q");
    bgImage = imageResponse.data['results'][4]['urls']['regular'];
    print(bgImage);
    setState(() {});
  }

  Future<void> getData() async {
    final dio = Dio();

    final response = await dio.get(
        'http://api.openweathermap.org/geo/1.0/direct?q=${controller.text}&limit=5&appid=e4c7d413beed7d8cc6521ae67ca4d8f0');
    // print(response.data);
    // print(response.data["lat"]);
    cityLat = response.data[0]["lat"].toString();
    cityLon = response.data[0]["lon"].toString();
    // print(cityLat);
    // print(cityLon);
    // cityLat = response.data["lat"];
    final responseWeatherCity = await dio.get(
        "https://api.openweathermap.org/data/2.5/weather?lat=${cityLat}&lon=${cityLon}&appid=e4c7d413beed7d8cc6521ae67ca4d8f0&units=metric");
    // print(responseWeatherCity.data);
    weatherTemp = responseWeatherCity.data["main"]["temp"];
    cityName = responseWeatherCity.data["name"];
    windSpeed = responseWeatherCity.data["wind"]["speed"];
    setState(() {});
  }
}
