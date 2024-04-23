import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app_project/resources/resources.dart';

class CitiesScreen extends StatelessWidget {
  const CitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
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
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 37,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Container(
                  width: 360,
                  height: 144,
                  color: Colors.amber,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 19, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "19",
                          style: TextStyle(fontSize: 62, color: Colors.white),
                        ),
                        Text(
                          "Montreal, Canada",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  right: 20,
                  top: 0,
                  child: Image(
                    image: AssetImage(Images.dayWind),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
