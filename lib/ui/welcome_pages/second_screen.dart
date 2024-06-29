import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_project/core/app_fonts.dart';
import 'package:weather_app_project/ui/PagesScreen.dart';

import '../../resources/resources.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({super.key});

  final dio = Dio();

  void getHttp() async {
    final response = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=42.882004&lon=74.582748&appid=e4c7d413beed7d8cc6521ae67ca4d8f0');
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double circleAvatarRadius = constraints.maxWidth * 0.08;
          double bottomContainerHeight = constraints.maxHeight * 0.75;
          double imageSize = constraints.maxWidth * 0.5;
          double titleFontSize = constraints.maxWidth * 0.08;
          double subtitleFontSize = constraints.maxWidth * 0.04;

          return Stack(
            children: [
              Positioned(
                bottom: -circleAvatarRadius * 5,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: double.infinity,
                  height: bottomContainerHeight,
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
                    SizedBox(height: constraints.maxHeight * 0.15),
                    Image(
                      image: const AssetImage(Images.sun),
                      width: imageSize,
                      height: imageSize,
                    ),
                    SizedBox(height: constraints.maxHeight * 0.07),
                    SizedBox(
                      width: constraints.maxWidth * 0.7,
                      child: Text(
                        "Choose your City",
                        textAlign: TextAlign.center,
                        style: AppFonts.s32bold.copyWith(
                          color: Colors.white,
                          fontSize: titleFontSize,
                        ),
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.04),
                    SizedBox(
                      width: constraints.maxWidth * 0.5,
                      child: Text(
                        "Get in-depth weather information",
                        textAlign: TextAlign.center,
                        style: AppFonts.s16regular.copyWith(
                          color: Colors.white,
                          fontSize: subtitleFontSize,
                        ),
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.07),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const PagesScreen(),
                            transitionDuration:
                                const Duration(milliseconds: 10),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              const curve = Curves.easeInOut;
                              var curveAnimation = CurvedAnimation(
                                parent: animation,
                                curve: curve,
                              );
                              return ScaleTransition(
                                scale: curveAnimation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: circleAvatarRadius,
                        backgroundColor: const Color(0xff333333),
                        child:
                            const Image(image: AssetImage(Images.arrowRight)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
