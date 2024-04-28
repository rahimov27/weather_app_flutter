import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_project/resources/resources.dart';
import 'package:marquee_widget/marquee_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();
  String cityLat = '';
  String cityLon = '';

  double weatherTemp = 0;
  String cityName = '';
  double windSpeed = 0;

  String bgImage = '';
  String defaultImage =
      "https://images.unsplash.com/photo-1512495039889-52a3b799c9bc?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1OTU1NjF8MHwxfHNlYXJjaHw1fHxNb3Njb3d8ZW58MHx8fHwxNzE0MjY4NDYyfDA&ixlib=rb-4.0.3&q=80";
  @override
  void initState() {
    bgImage = defaultImage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191919),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: SizedBox(
            width: 361,
            child: TextField(
              style: const TextStyle(color: Colors.white),
              controller: controller,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: "Enter city name",
                hintStyle: const TextStyle(
                  color: Colors.white,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    getData();
                    findImage();
                    controller.text = '';
                  },
                ),
              ),
            ),
          ),
          backgroundColor: const Color(0xff292929),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.10), BlendMode.srcOver),
                      child: Image.network(
                        bgImage ?? defaultImage,
                        height: 400,
                        width: 361,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 26,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 26,
                        ),
                        Text(
                          cityName,
                          style: const TextStyle(
                              fontSize: 36,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        Text(
                          weatherTemp.toString(),
                          style: GoogleFonts.reemKufi(
                            fontSize: 100,
                            color: Colors.white,
                          ),
                        ),
                        // Text(
                        //   "Wind speed $windSpeed",
                        //   style: const TextStyle(
                        //       fontSize: 40, color: Colors.white),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      MyDailyWidget(),
                      MyDailyWidget(),
                      MyDailyWidget(),
                      MyDailyWidget(),
                      MyDailyWidget(),
                      MyDailyWidget(),
                    ],
                  ),
                ),
              ),
              // Marquee(
              //   child: Text(
              //     'This project is a starting point for a Dart package This project is a starting point for a Dart package',
              //     style: TextStyle(color: Colors.white),
              //   ),
              //   direction: Axis.horizontal,
              //   textDirection: TextDirection.rtl,
              //   animationDuration: Duration(
              //       seconds: 10), // Adjust animation duration as needed
              //   backDuration:
              //       Duration(seconds: 10), // Adjust back duration as needed
              //   pauseDuration: Duration.zero, // Set pause duration to zero
              //   directionMarguee: DirectionMarguee.oneDirection,
              // )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> findImage() async {
    final dio = Dio();
    final imageResponse = await dio.get(
        "https://api.unsplash.com/search/photos?query=${controller.text}&client_id=pDwlc8evJ9bxPFLNW7uWhbpSRmxxtLHdnEN0Nr0L94Q");
    bgImage = imageResponse.data['results'][4]['urls']['regular'];
    print(bgImage);
    setState(() {});

    String defaultImage =
        "https://images.unsplash.com/photo-1512495039889-52a3b799c9bc?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1OTU1NjF8MHwxfHNlYXJjaHw1fHxNb3Njb3d8ZW58MHx8fHwxNzE0MjY4NDYyfDA&ixlib=rb-4.0.3&q=80&w=1080";
  }

  Future<void> getData() async {
    final dio = Dio();

    final response = await dio.get(
        'http://api.openweathermap.org/geo/1.0/direct?q=${controller.text}&limit=5&appid=e4c7d413beed7d8cc6521ae67ca4d8f0');
    // print(response.data);
    // print(response.data["lat"]);
    cityLat = response.data[0]["lat"].toString();
    cityLon = response.data[0]["lon"].toString();
    // print(cityLat);
    // print(cityLon);
    // cityLat = response.data["lat"];
    final responseWeatherCity = await dio.get(
        "https://api.openweathermap.org/data/2.5/weather?lat=${cityLat}&lon=${cityLon}&appid=e4c7d413beed7d8cc6521ae67ca4d8f0&units=metric");
    // print(responseWeatherCity.data);
    weatherTemp = responseWeatherCity.data["main"]["temp"];
    cityName = responseWeatherCity.data["name"];
    windSpeed = responseWeatherCity.data["wind"]["speed"];
    setState(() {});
  }
}

class MyDailyWidget extends StatelessWidget {
  const MyDailyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xff292929),
      ),
      height: 130,
      width: 60,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Mon",
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
          Image(
            image: AssetImage(Images.cloud1),
            width: 60,
          ),
          Text(
            "26",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
