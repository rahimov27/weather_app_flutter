import 'package:flutter/material.dart';
import 'package:weather_app_project/core/app_fonts.dart';
import 'package:weather_app_project/resources/resources.dart';
import 'package:weather_app_project/ui/common_widgets/my_container.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  int _selectedIndex = 2;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page'),
    Text('Search Page'),
    Text('Favorites Page'),
    Text('Settings Page'),
    Text('Profile Page'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191919),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            size: 24,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Potsdam, Berlin",
          style: AppFonts.s16regular.copyWith(color: Colors.white),
        ),
        backgroundColor: const Color(0xff292929),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 24,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Column(
            children: [
              Text(
                "Moscow, Russia",
                style: AppFonts.s32bold.copyWith(color: Colors.white),
              ),
              Text(
                "17:51",
                style: AppFonts.s16regular.copyWith(color: Colors.white),
              ),
              const Stack(
                children: <Widget>[
                  Text(
                    "18",
                    style: TextStyle(
                      fontSize: 170,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 80),
                    child: Image(
                      image: AssetImage(Images.dayWind),
                    ),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyContainer(
                    typeWeather: 'Wind',
                    temp: '9km/h',
                    image: Images.hazzy,
                  ),
                  MyContainer(
                    typeWeather: 'Chance of Rain',
                    temp: '50km/h',
                    image: Images.stormyDay,
                  ),
                  MyContainer(
                    typeWeather: 'Real feel',
                    temp: '23.8',
                    image: Images.sunny,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff262626),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Color(0xff262626),
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xff262626),
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xff262626),
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xff262626),
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xff262626),
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedIconTheme: const IconThemeData(color: Color(0xffC6C6C6)),
        selectedItemColor: const Color(0xff6929C4),
        onTap: _onItemTapped,
      ),
    );
  }
}
