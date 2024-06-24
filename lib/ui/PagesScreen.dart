import 'package:flutter/material.dart';
import 'package:weather_app_project/resources/resources.dart';
import 'package:weather_app_project/ui/SearchPage.dart';
import 'package:weather_app_project/ui/LikedPage.dart';
import 'package:weather_app_project/ui/HomePage.dart';

void main() {
  runApp(const MaterialApp(
    home: PagesScreen(),
  ));
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Pages screen"),
      // ),
      body: widgets[currentIndex],
      bottomNavigationBar: SizedBox(
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
              label: "Search",
            ),
          ],
        ),
      ),
    );
  }
}
