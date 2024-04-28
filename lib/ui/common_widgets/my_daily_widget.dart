import 'package:flutter/material.dart';
import 'package:weather_app_project/resources/resources.dart';

class MyDailyWidget extends StatelessWidget {
  const MyDailyWidget({super.key, required this.day, required this.temp});

  final String day;
  final String temp;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xff292929),
      ),
      height: 130,
      width: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
          const Image(
            image: AssetImage(Images.cloud1),
            width: 60,
          ),
          Text(
            temp,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
