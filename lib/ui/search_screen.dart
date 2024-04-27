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
                        controller.text = '';
                      },
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                weatherTemp.toString(),
                style: TextStyle(fontSize: 40),
              ),
              Text(
                cityName,
                style: TextStyle(fontSize: 40),
              ),
              Text(
                "Wind speed $windSpeed",
                style: TextStyle(fontSize: 40),
              ),
            ],
          ),
        ),
      ),
    );
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
    print(responseWeatherCity.data);
    weatherTemp = responseWeatherCity.data["main"]["temp"];
    cityName = responseWeatherCity.data["name"];
    windSpeed = responseWeatherCity.data["wind"]["speed"];
    setState(() {});
  }
}
