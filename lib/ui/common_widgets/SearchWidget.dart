import 'package:flutter/material.dart';
import 'package:weather_app_project/core/app_fonts.dart';

class SearchWidget extends StatelessWidget {
  final String day;
  final String temp;
  final String? imagePath;

  const SearchWidget({
    Key? key,
    required this.day,
    required this.temp,
    this.imagePath,
  }) : super(key: key);

  bool _isNetworkImage(String path) {
    return path.startsWith('http') || path.startsWith('https');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white),
        color: const Color(0xff262626),
      ),
      width: 115,
      height: 64,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            day,
            style: AppFonts.s12regular.copyWith(color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                temp,
                style: AppFonts.s16regular.copyWith(color: Colors.white),
              ),
              if (imagePath != null)
                _isNetworkImage(imagePath!)
                    ? Image.network(
                        imagePath!,
                        width: 30,
                        height: 30,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(Icons.error, color: Colors.red);
                        },
                      )
                    : Image.asset(
                        imagePath!,
                        width: 30,
                        height: 30,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(Icons.error, color: Colors.red);
                        },
                      ),
            ],
          ),
        ],
      ),
    );
  }
}
