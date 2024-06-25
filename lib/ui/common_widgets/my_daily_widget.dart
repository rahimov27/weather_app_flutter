import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyDailyWidget extends StatelessWidget {
  const MyDailyWidget({
    super.key,
    required this.day,
    required this.temp,
    this.imagePath,
  });

  final String day;
  final String temp;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xff292929),
      ),
      height: 130,
      width: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            day,
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
          if (imagePath != null)
            SvgPicture.asset(
              imagePath!,
              width: 24,
              height: 24,
            )
          else
            const SizedBox(
              width: 24,
              height: 24,
            ),
          Text(
            temp,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
