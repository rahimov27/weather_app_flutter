import 'package:flutter/material.dart';
import 'package:weather_app_project/resources/resources.dart';

class CitiesScreen extends StatelessWidget {
  const CitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
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

class MyCitiesWidget extends StatelessWidget {
  const MyCitiesWidget(
      {super.key,
      required this.weatherImage,
      required this.cityName,
      required this.weatherTemp});

  final String weatherTemp;
  final String cityName;
  final String weatherImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Container(
          width: 360,
          height: 144,
          decoration: const BoxDecoration(
            color: Color(0xff292929),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(400),
              topLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 19, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  weatherTemp,
                  style: TextStyle(fontSize: 62, color: Colors.white),
                ),
                Text(
                  cityName,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 20,
          top: 0,
          child: Image(
            image: AssetImage(weatherImage),
          ),
        ),
      ],
    );
  }
}
