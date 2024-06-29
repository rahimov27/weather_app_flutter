import 'package:flutter/material.dart';

class MyCitiesWidget extends StatelessWidget {
  const MyCitiesWidget(
      {super.key, required this.cityName, required this.weatherTemp});

  final String weatherTemp;
  final String cityName;

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
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  weatherTemp,
                  style: const TextStyle(fontSize: 62, color: Colors.white),
                ),
                Text(
                  cityName,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
