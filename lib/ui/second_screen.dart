import 'package:flutter/material.dart';
import 'package:weather_app_project/core/app_fonts.dart';
import 'package:weather_app_project/ui/weather_screen.dart';

import '../resources/resources.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 113),
            const Image(image: AssetImage(Images.sun)),
            const SizedBox(height: 51),
            SizedBox(
              width: 274,
              child: Text(
                textAlign: TextAlign.center,
                "Detailed Hourly Forecast",
                style: AppFonts.s32bold.copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 187,
              child: Text(
                textAlign: TextAlign.center,
                "Get in - depth weather information",
                style: AppFonts.s16regular
                    .copyWith(color: const Color(0xff545454)),
              ),
            ),
            const SizedBox(height: 68),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WeatherScreen()));
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
    );
  }
}
