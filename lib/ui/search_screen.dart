import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_project/ui/common_widgets/my_daily_widget.dart';
// import 'package:marquee_widget/marquee_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();

  String dayOneTemp = '';
  String dayOneDate = '';

  String dayTwoTemp = '';
  String dayTwoDate = '';

  String dayThreeTemp = '';
  String dayThreeDate = '';

  String dayFourTemp = '';
  String dayFourDate = '';

  String dayFiveTemp = '';
  String dayFiveDate = '';

  double todayTemp = 0;

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
                    findImage();
                    getDataByDay();
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
                        bgImage,
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
                          todayTemp.toString(),
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
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      MyDailyWidget(
                        day: dayOneDate.length >= 10
                            ? dayOneDate.substring(8, 10)
                            : '',
                        temp: dayOneTemp,
                      ),
                      MyDailyWidget(
                        day: dayTwoDate.length >= 10
                            ? dayTwoDate.substring(8, 10)
                            : '',
                        temp: dayTwoTemp,
                      ),
                      MyDailyWidget(
                        day: dayThreeDate.length >= 10
                            ? dayThreeDate.substring(8, 10)
                            : '',
                        temp: dayThreeTemp,
                      ),
                      MyDailyWidget(
                        day: dayFourDate.length >= 10
                            ? dayFourDate.substring(8, 10)
                            : '',
                        temp: dayFiveTemp,
                      ),
                      MyDailyWidget(
                        day: dayFiveDate.length >= 10
                            ? dayFiveDate.substring(8, 10)
                            : '',
                        temp: dayFiveTemp,
                      ),
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
    // print(bgImage);
    setState(() {});

    String defaultImage =
        "https://images.unsplash.com/photo-1512495039889-52a3b799c9bc?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1OTU1NjF8MHwxfHNlYXJjaHw1fHxNb3Njb3d8ZW58MHx8fHwxNzE0MjY4NDYyfDA&ixlib=rb-4.0.3&q=80&w=1080";
  }

  Future<void> getDataByDay() async {
    final dio = Dio();

    final response = await dio.get(
        'https://api.openweathermap.org/geo/1.0/direct?q=${controller.text}&limit=5&appid=e4c7d413beed7d8cc6521ae67ca4d8f0');
    cityLat = response.data[0]["lat"].toString();
    cityLon = response.data[0]["lon"].toString();
    final responseWeatherCity = await dio.get(
        "https://api.openweathermap.org/data/2.5/forecast?lat=${cityLat}&lon=${cityLon}&appid=e4c7d413beed7d8cc6521ae67ca4d8f0&units=metric");
    // print(responseWeatherCity.data);
    // dayOneTemp = responseWeatherCity.data["list"][0];
    // dayTwoTemp = responseWeatherCity.data["list"][8]["dt_txt"];
    // dayThreeTemp = responseWeatherCity.data["list"][16]["dt_txt"];
    // dayFourTemp = responseWeatherCity.data["list"][24]["dt_txt"];
    // dayFiveTemp = responseWeatherCity.data["list"][32]["dt_txt"];

    todayTemp = responseWeatherCity.data["list"][0]["main"]["temp"];

    dayOneTemp = responseWeatherCity.data["list"][0]["main"]["temp"].toString();
    dayOneDate = responseWeatherCity.data["list"][0]["dt_txt"].toString();

    dayTwoTemp = responseWeatherCity.data["list"][8]["main"]["temp"].toString();
    dayTwoDate = responseWeatherCity.data["list"][8]["dt_txt"].toString();

    dayThreeTemp =
        responseWeatherCity.data["list"][16]["main"]["temp"].toString();
    dayThreeDate = responseWeatherCity.data["list"][16]["dt_txt"].toString();

    dayFourTemp =
        responseWeatherCity.data["list"][24]["main"]["temp"].toString();
    dayFourDate = responseWeatherCity.data["list"][24]["dt_txt"].toString();

    dayFiveTemp =
        responseWeatherCity.data["list"][32]["main"]["temp"].toString();
    dayFiveDate = responseWeatherCity.data["list"][32]["dt_txt"].toString();

    // print("day one date -${dayOneDate} --- day one temp ${dayOneTemp}");
    // print(dayOneDate.substring(8, 10));

    setState(() {});
  }
}
