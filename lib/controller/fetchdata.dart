
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer_animation/shimmer_animation.dart';
import 'dart:convert';
import 'package:weather_api_project_practice/view/weatherpage.dart';
import 'package:weather_api_project_practice/view/nodatapage.dart';

class WeatherApi extends StatelessWidget {
  String inputLocation = '';
  WeatherApi(this.inputLocation, {super.key});
  String inputLoc="salem";
  Future fetchDataUsingAPI() async {
    var url = Uri.parse( //ma
      'https://api.tomorrow.io/v4/weather/realtime?location=salem&apikey=KE2m3mn2dvt7ipMh3VhgRQ8sWrMNLhSU',
    );
    var url2 = Uri.parse( //ba
      'https://api.tomorrow.io/v4/weather/realtime?location=$inputLocation&apikey=59HR6ofCRGiWJXOIxKPgiw4xmtcsKM4V',
    );

    try {
      final response = await http.get(url2);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print("API error: ${response.statusCode}");

      }
    } catch (e) {
      print("Exception: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // child: FutureBuilder(
      //   future: fetchDataUsingAPI(),
      //   builder: (context, snapshot) {
      //     print(snapshot);
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(child: Shimmer(child: CircularProgressIndicator()));
      //     } else if (snapshot.hasError) {
      //       return Center(
      //         child: Text(
      //           "Sorry For the Incovience Some errror HasBeen Occured",
      //         ),
      //       );
      //     }
      //     // else if (!snapshot.hasData){
      //     //   return noDataPage();
      //     // }
      //     else {
      //       Map OutputData = snapshot.data;
      //       return WeatherPage(
      //         OutputData["location"],
      //         OutputData["data"]["time"],
      //         OutputData["data"]["values"],
      //       );
      //     }
      //   },
      // ),

      child: WeatherPage(weatherData["location"],weatherData["data"]["time"],weatherData["data"]["values"])
    );
  }
}

final Map<String, dynamic> weatherData = {
  "data": {
    "time": "2025-07-24T03:49:00Z",
    "values": {
      "altimeterSetting": 1019.67,
      "cloudBase": 16,
      "cloudCeiling": 16,
      "cloudCover": 0,
      "dewPoint": 17.9,
      "freezingRainIntensity": 0,
      "humidity": 82,
      "precipitationProbability": 0,
      "pressureSeaLevel": 1020.16,
      "pressureSurfaceLevel": 1006.02,
      "rainIntensity": 0,
      "sleetIntensity": 0,
      "snowIntensity": 0,
      "temperature": 21,
      "temperatureApparent": 21,
      "visibility": 16,
      "weatherCode": 1000,
      "windDirection": 82,
      "windGust": 2.4,
      "windSpeed": 2.4,
    },
  },
  "location": {
    "lat": 43.1561698913574,
    "lon": -75.8449935913086,
    "name": "New Yortk, United States",
    "type": "administrative",
  },
};
