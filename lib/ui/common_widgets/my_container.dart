import 'package:flutter/material.dart';
import 'package:weather_app_project/core/app_fonts.dart';

class MyContainer extends StatelessWidget {
  const MyContainer(
      {super.key,
      required this.typeWeather,
      required this.temp,
      required this.image});

  final String typeWeather;
  final String temp;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.green),
        width: 110,
        height: 64,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                typeWeather,
                style: AppFonts.s12regular,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    temp,
                    style: AppFonts.s16regular,
                  ),
                  const Spacer(),
                  Image(image: AssetImage(image))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}