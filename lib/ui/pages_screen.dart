import 'package:flutter/material.dart';
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
    const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Screen0"),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Pages screen"),
      // ),
      body: widgets[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.verified_user),
            label: "User",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            label: "Face",
          ),
        ],
      ),
    );
  }
}
