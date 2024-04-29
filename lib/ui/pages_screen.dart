import 'package:flutter/material.dart';
import 'package:weather_app_project/resources/resources.dart';
import 'package:weather_app_project/ui/search_screen.dart';
import 'package:weather_app_project/ui/cities_screen.dart';
import 'package:weather_app_project/ui/weather_screen.dart';

void main() {
  runApp(const MaterialApp(
    home: MyScreens(),
  ));
}

class MyScreens extends StatefulWidget {
  const MyScreens({super.key});

  @override
  State<MyScreens> createState() => _MyScreensState();
}

class _MyScreensState extends State<MyScreens> {
  int currentIndex = 0;

  List<Widget> widgets = [
    const WeatherScreen(),
    const CitiesScreen(),
    const SearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Pages screen"),
      // ),
      body: widgets[currentIndex],
      bottomNavigationBar: Container(
        height: 96,
        child: BottomNavigationBar(
          fixedColor: const Color(0xffC5FD39),
          currentIndex: currentIndex,
          unselectedItemColor: Colors.white.withOpacity(0.60),
          backgroundColor: const Color(0xff262626),
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
              icon: Image(
                image: AssetImage(
                  Images.home,
                ),
              ), // Replace 'home_icon.png' with your image asset path
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Image(
                image: AssetImage(Images.heart),
              ),
              label: "Liked",
            ),
            BottomNavigationBarItem(
              icon: Image(
                image: AssetImage(Images.search),
              ),
              label: "User",
            ),
          ],
        ),
      ),
    );
  }
}
