import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_project/core/app_fonts.dart';
import 'package:weather_app_project/ui/second_screen.dart';

import '../resources/resources.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff292929),
      appBar: AppBar(
        title: const Text("First screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 113),
            const Image(image: AssetImage(Images.nightMoon)),
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
                "Detailed Hourly Forecast",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff000000)),
              ),
            ),
            const SizedBox(height: 30),
            const SizedBox(
              width: 155,
              child: Text(
                textAlign: TextAlign.center,
                "Get in - depth weather information",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
            ),
            const SizedBox(height: 68),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()));
              },
              child: const CircleAvatar(
                radius: 31.5,
                backgroundColor: Color(0xff333333),
                child: Image(image: AssetImage(Images.arrowRight)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
