import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrentCityScreen extends StatelessWidget {
  const CurrentCityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Current City Screen"),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.search, size: 22),
          ),
        ],
      ),
      body: const Center(
        child: Column(
          children: [
            Text(
              "Moscow, Russia",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 5),
            Text(
              "17:51",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
