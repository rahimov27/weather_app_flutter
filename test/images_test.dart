import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app_project/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.dayCloudWithRainsDrops).existsSync(), isTrue);
    expect(File(Images.dayPartlyCloudyWithAngledRain).existsSync(), isTrue);
    expect(File(Images.dayPartlyCloudy).existsSync(), isTrue);
    expect(File(Images.dayWind).existsSync(), isTrue);
    expect(File(Images.heart).existsSync(), isTrue);
    expect(File(Images.home).existsSync(), isTrue);
    expect(File(Images.nightPartlyCloudyWithRain1).existsSync(), isTrue);
    expect(File(Images.profile).existsSync(), isTrue);
    expect(File(Images.search).existsSync(), isTrue);
    expect(File(Images.setting).existsSync(), isTrue);
    expect(File(Images.sun).existsSync(), isTrue);
    expect(File(Images.arrowRight).existsSync(), isTrue);
    expect(File(Images.cloud1).existsSync(), isTrue);
    expect(File(Images.hazzy).existsSync(), isTrue);
    expect(File(Images.locationPoint).existsSync(), isTrue);
    expect(File(Images.nightMoon).existsSync(), isTrue);
    expect(File(Images.stormyDay).existsSync(), isTrue);
    expect(File(Images.sunny).existsSync(), isTrue);
  });
}
