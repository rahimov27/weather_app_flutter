import 'package:flutter/material.dart';

class MyRowWidget extends StatelessWidget {
  const MyRowWidget({
    super.key,
    required this.temp,
    required this.image,
    required this.typeOfWeather,
  });

  final String temp;
  final String image;
  final String typeOfWeather;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        height: 115,
        width: 50,
        decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xffC5FD39),
            ),
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(typeOfWeather),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Image(
                image: AssetImage(image),
              ),
            ),
            Text(temp)
          ],
        ),
      ),
    );
  }
}
