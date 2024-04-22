import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app_project/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.sun).existsSync(), isTrue);
    expect(File(Images.arrowRight).existsSync(), isTrue);
    expect(File(Images.locationPoint).existsSync(), isTrue);
    expect(File(Images.nightMoon).existsSync(), isTrue);
  });
}
