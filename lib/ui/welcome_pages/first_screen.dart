import 'package:flutter/material.dart';
import 'package:weather_app_project/core/app_fonts.dart';
import 'package:weather_app_project/ui/welcome_pages/second_screen.dart';
import '../../resources/resources.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff292929),
      appBar: AppBar(
        backgroundColor: const Color(0xff292929),
        elevation: 0,
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
                      color: Colors.white),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: constraints.maxHeight * 0.15),
                    Image(
                      image: const AssetImage(Images.nightMoon),
                      width: imageSize,
                      height: imageSize,
                    ),
                    SizedBox(height: constraints.maxHeight * 0.07),
                    SizedBox(
                      width: constraints.maxWidth * 0.7,
                      child: Text(
                        "Detailed Hourly Forecast",
                        textAlign: TextAlign.center,
                        style: AppFonts.s32bold.copyWith(
                          color: Colors.black,
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
                          color: const Color(0xff545454),
                          fontSize: subtitleFontSize,
                        ),
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.03),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    SecondScreen(),
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
