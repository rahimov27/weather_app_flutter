import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_project/ui/common_widgets/my_daily_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController controller = TextEditingController();

  String dayOneTemp = '';
  String dayOneDate = '';
  String dayOneIcon = '';

  String dayTwoTemp = '';
  String dayTwoDate = '';
  String dayTwoIcon = '';

  String dayThreeTemp = '';
  String dayThreeDate = '';
  String dayThreeIcon = '';

  String dayFourTemp = '';
  String dayFourDate = '';
  String dayFourIcon = '';

  String dayFiveTemp = '';
  String dayFiveDate = '';
  String dayFiveIcon = '';

  double todayTemp = 0;

  String cityLat = '';
  String cityLon = '';

  double weatherTemp = 0;
  String cityName = '';
  String cityCode = '';
  double windSpeed = 0;

  String bgImage = '';
  String defaultImage =
      "https://images.unsplash.com/photo-1512495039889-52a3b799c9bc?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1OTU1NjF8MHwxfHNlYXJjaHw1fHxNb3Njb3d8ZW58MHx8fHwxNzE0MjY4NDYyfDA&ixlib=rb-4.0.3&q=80";

  @override
  void initState() {
    super.initState();
    bgImage = defaultImage;
    searchCity('Potsdam'); // Default search city
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                hintText: "Enter city name",
                hintStyle: const TextStyle(
                  color: Colors.white,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    searchCity(controller.text);
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
                        height: screenSize.height * 0.5,
                        width: screenSize.width * 0.9,
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
                          "$cityName $cityCode",
                          style: const TextStyle(
                              fontSize: 36,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        Text(
                          todayTemp.toString(),
                          style: GoogleFonts.reemKufi(
                            fontSize: screenSize.width * 0.2,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    MyDailyWidget(
                      day: dayOneDate.length >= 10
                          ? dayOneDate.substring(8, 10)
                          : '1',
                      temp: dayOneTemp,
                      imagePath: dayOneIcon.isNotEmpty
                          ? 'http://openweathermap.org/img/wn/$dayOneIcon@2x.png'
                          : null,
                    ),
                    MyDailyWidget(
                      day: dayTwoDate.length >= 10
                          ? dayTwoDate.substring(8, 10)
                          : '2',
                      temp: dayTwoTemp,
                      imagePath: dayTwoIcon.isNotEmpty
                          ? 'http://openweathermap.org/img/wn/$dayTwoIcon@2x.png'
                          : null,
                    ),
                    MyDailyWidget(
                      day: dayThreeDate.length >= 10
                          ? dayThreeDate.substring(8, 10)
                          : '3',
                      temp: dayThreeTemp,
                      imagePath: dayThreeIcon.isNotEmpty
                          ? 'http://openweathermap.org/img/wn/$dayThreeIcon@2x.png'
                          : null,
                    ),
                    MyDailyWidget(
                      day: dayFourDate.length >= 10
                          ? dayFourDate.substring(8, 10)
                          : '4',
                      temp: dayFourTemp,
                      imagePath: dayFourIcon.isNotEmpty
                          ? 'http://openweathermap.org/img/wn/$dayFourIcon@2x.png'
                          : null,
                    ),
                    MyDailyWidget(
                      day: dayFiveDate.length >= 10
                          ? dayFiveDate.substring(8, 10)
                          : '5',
                      temp: dayFiveTemp,
                      imagePath: dayFiveIcon.isNotEmpty
                          ? 'http://openweathermap.org/img/wn/$dayFiveIcon@2x.png'
                          : null,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> searchCity(String city) async {
    final dio = Dio();

    try {
      final response = await dio.get(
          'https://api.openweathermap.org/geo/1.0/direct?q=$city&limit=5&appid=e4c7d413beed7d8cc6521ae67ca4d8f0');
      cityLat = response.data[0]["lat"].toString();
      cityLon = response.data[0]["lon"].toString();
      final responseWeatherCity = await dio.get(
          "https://api.openweathermap.org/data/2.5/forecast?lat=$cityLat&lon=$cityLon&appid=e4c7d413beed7d8cc6521ae67ca4d8f0&units=metric");

      cityName = response.data[0]["name"];
      cityCode = response.data[0]["country"];

      todayTemp = responseWeatherCity.data["list"][0]["main"]["temp"];

      dayOneTemp =
          responseWeatherCity.data["list"][0]["main"]["temp"].toString();
      dayOneDate = responseWeatherCity.data["list"][0]["dt_txt"].toString();
      dayOneIcon = responseWeatherCity.data["list"][0]["weather"][0]["icon"];

      dayTwoTemp =
          responseWeatherCity.data["list"][8]["main"]["temp"].toString();
      dayTwoDate = responseWeatherCity.data["list"][8]["dt_txt"].toString();
      dayTwoIcon = responseWeatherCity.data["list"][8]["weather"][0]["icon"];

      dayThreeTemp =
          responseWeatherCity.data["list"][16]["main"]["temp"].toString();
      dayThreeDate = responseWeatherCity.data["list"][16]["dt_txt"].toString();
      dayThreeIcon = responseWeatherCity.data["list"][16]["weather"][0]["icon"];

      dayFourTemp =
          responseWeatherCity.data["list"][24]["main"]["temp"].toString();
      dayFourDate = responseWeatherCity.data["list"][24]["dt_txt"].toString();
      dayFourIcon = responseWeatherCity.data["list"][24]["weather"][0]["icon"];

      dayFiveTemp =
          responseWeatherCity.data["list"][32]["main"]["temp"].toString();
      dayFiveDate = responseWeatherCity.data["list"][32]["dt_txt"].toString();
      dayFiveIcon = responseWeatherCity.data["list"][32]["weather"][0]["icon"];

      findImage(city);
      setState(() {});
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> findImage(String city) async {
    final dio = Dio();
    try {
      final imageResponse = await dio.get(
          "https://api.unsplash.com/search/photos?query=$city&client_id=pDwlc8evJ9bxPFLNW7uWhbpSRmxxtLHdnEN0Nr0L94Q");
      bgImage = imageResponse.data['results'][4]['urls']['regular'];
    } catch (e) {
      bgImage = defaultImage;
      print('Error: $e');
    }
    setState(() {});
  }
}
