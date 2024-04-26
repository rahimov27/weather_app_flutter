import 'package:flutter/material.dart';

class MyCitiesWidget extends StatelessWidget {
  const MyCitiesWidget(
      {super.key,
      required this.weatherImage,
      required this.cityName,
      required this.weatherTemp});

  final String weatherTemp;
  final String cityName;
  final String weatherImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Container(
          width: 360,
          height: 144,
          decoration: const BoxDecoration(
            color: Color(0xff292929),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(400),
              topLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 19, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  weatherTemp,
                  style: const TextStyle(fontSize: 62, color: Colors.white),
                ),
                Text(
                  cityName,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 20,
          top: 0,
          child: Image(
            image: AssetImage(weatherImage),
          ),
        ),
      ],
    );
  }
}
