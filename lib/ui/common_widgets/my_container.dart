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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white),
        color: const Color(0xff262626),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 10),
      constraints: const BoxConstraints(
        minWidth: 64, 
        maxWidth: double.infinity, 
      ),
      child: Column(
        mainAxisSize:
            MainAxisSize.min, 
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            typeWeather,
            style: AppFonts.s12regular.copyWith(color: Colors.white),
          ),
          Row(
            mainAxisSize:
                MainAxisSize.min, 
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                temp,
                style: AppFonts.s16regular.copyWith(color: Colors.white),
              ),
              Image(image: AssetImage(image))
            ],
          ),
        ],
      ),
    );
  }
}
