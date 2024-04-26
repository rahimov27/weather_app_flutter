import 'package:flutter/material.dart';
import 'package:weather_app_project/resources/resources.dart';
import 'package:weather_app_project/ui/common_widgets/my_cities_widget.dart';

class CitiesScreen extends StatelessWidget {
  const CitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: const Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 37,
              ),
              MyCitiesWidget(
                cityName: "Russia, Moscow",
                weatherTemp: "21",
                weatherImage: Images.dayWind,
              ),
              SizedBox(
                height: 37,
              ),
              MyCitiesWidget(
                cityName: "Germany, Potsdam",
                weatherTemp: "12",
                weatherImage: Images.dayWind,
              ),
              SizedBox(
                height: 37,
              ),
              MyCitiesWidget(
                cityName: "Kyrgyzstan, Bishkek",
                weatherTemp: "30",
                weatherImage: Images.dayWind,
              ),
              SizedBox(
                height: 37,
              ),
              MyCitiesWidget(
                cityName: "Ukraine, Kiev",
                weatherTemp: "21",
                weatherImage: Images.dayWind,
              ),
              SizedBox(
                height: 37,
              ),
              MyCitiesWidget(
                cityName: "Germany, Berlin",
                weatherTemp: "5",
                weatherImage: Images.dayWind,
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
