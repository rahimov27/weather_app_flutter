import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_project/models/weather_model.dart';

class CurrentCityScreen extends StatelessWidget {
  const CurrentCityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    final dateFormatter = DateFormat('MMMM dd, HH:mm');
    final formattedDate = dateFormatter.format(currentDate);

    List<WeatherModel> data = [
      WeatherModel(
        day: 'Monday',
        image: 'assets/images/cloud1.png',
        temp: '10',
      ),
      WeatherModel(
        day: 'Monday',
        image: 'assets/images/cloud1.png',
        temp: '10',
      ),
      WeatherModel(
        day: 'Monday',
        image: 'assets/images/cloud1.png',
        temp: '10',
      ),
      WeatherModel(
        day: 'Monday',
        image: 'assets/images/cloud1.png',
        temp: '10',
      ),
      WeatherModel(
        day: 'Monday',
        image: 'assets/images/cloud1.png',
        temp: '10',
      ),
      WeatherModel(
        day: 'Monday',
        image: 'assets/images/cloud1.png',
        temp: '10',
      ),
      WeatherModel(
        day: 'Monday',
        image: 'assets/images/cloud1.png',
        temp: '10',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Current City Screen"),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.search, size: 22),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Text(
              formattedDate,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 150,
            ),
            Expanded(
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) =>
                      WeatherWidget(model: data[index])),
            )
          ],
        ),
      ),
    );
  }
}

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key, required this.model});

  final WeatherModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            model.day,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          Image.asset(model.image),
          Text(
            model.temp,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
