import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_project/ui/current_city_screen.dart';

import '../resources/resources.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff292929),
      appBar: AppBar(
        title: const Text("Second screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 113),
            const Image(image: AssetImage(Images.sun)),
            const SizedBox(height: 51),
            // Container(
            //   width: 319,
            //   height: 319,
            //   // color: Colors.white,
            //   decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(1000)),
            // )
            const SizedBox(
              width: 178,
              child: Text(
                textAlign: TextAlign.center,
                "Choose your City",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const SizedBox(height: 30),
            const SizedBox(
              width: 155,
              child: Text(
                textAlign: TextAlign.center,
                "Get in - depth weather information",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0xffA5A5A5)),
              ),
            ),
            const SizedBox(height: 68),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CurrentCityScreen()));
              },
              child: const CircleAvatar(
                radius: 31.5,
                backgroundColor: Color(0xff333333),
                child: Image(image: AssetImage(Images.locationPoint)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
