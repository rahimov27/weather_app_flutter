import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_project/core/app_fonts.dart';
import 'package:weather_app_project/ui/pages_screen.dart';

import '../resources/resources.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({super.key});

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
                          builder: (context) => const MyScreens()),
                    );
                  },
                  child: const CircleAvatar(
                    radius: 31.5,
                    backgroundColor: Color(0xff333333),
                    child: Image(image: AssetImage(Images.arrowRight)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  final dio = Dio();

  void getHttp() async {
    final response = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=42.882004&lon=74.582748&appid=e4c7d413beed7d8cc6521ae67ca4d8f0');
    print(response);
  }
}
