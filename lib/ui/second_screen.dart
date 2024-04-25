import 'package:flutter/material.dart';
import 'package:weather_app_project/core/app_fonts.dart';
import 'package:weather_app_project/ui/weather_screen.dart';

import '../resources/resources.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: -210,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.bottomCenter,
              width: double.infinity,
              height: 600,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1000),
                  shape: BoxShape.rectangle,
                  color: const Color(0xff292929)),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 113),
                const Image(image: AssetImage(Images.sun)),
                const SizedBox(height: 51),
                SizedBox(
                  width: 250,
                  child: Text(
                    "Choose your City",
                    textAlign: TextAlign.center,
                    style: AppFonts.s32bold.copyWith(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: 187,
                  child: Text(
                    "Get in - depth weather information",
                    textAlign: TextAlign.center,
                    style: AppFonts.s16regular.copyWith(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 68),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WeatherScreen()),
                    );
                  },
                  child: const CircleAvatar(
                    radius: 31.5,
                    backgroundColor: Color(0xff333333),
                    child: Image(image: AssetImage(Images.locationPoint)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
