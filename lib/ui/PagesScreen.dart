import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_project/ui/SearchPage.dart';
import 'package:weather_app_project/ui/LikedPage.dart';
import 'package:weather_app_project/ui/HomePage.dart';
import 'package:weather_app_project/ui/SettingsScreen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff191919),
        primarySwatch: Colors.blue,
        canvasColor: const Color(0xff191919),
      ),
      home: const PagesScreen(),
    );
  }
}

class PagesScreen extends StatefulWidget {
  const PagesScreen({super.key});

  @override
  State<PagesScreen> createState() => _PagesScreenState();
}

class _PagesScreenState extends State<PagesScreen> {
  int currentIndex = 0;

  List<Widget> widgets = [
    const HomePage(),
    const CitiesScreen(),
    const SearchPage(),
    const SettingsScreen(),
  ];

  final iconList = <IconData>[
    Icons.home,
    Icons.favorite,
    Icons.search,
    Icons.settings,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets[currentIndex],
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: currentIndex,
        gapLocation: GapLocation.none,
        notchSmoothness: NotchSmoothness.defaultEdge,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        backgroundColor: const Color(0xff262626),
        activeColor: Colors.white,
        inactiveColor: Colors.white.withOpacity(0.30),
        iconSize: 24,
        hideAnimationCurve: Curves.easeInOut,
        scaleFactor: 1.5,
      ),
    );
  }
}
