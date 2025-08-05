import 'package:flutter/material.dart';
import 'package:weather_api_project_practice/core/constants.dart';

class WeatherPage extends StatelessWidget {
  final String datatime;
  final Map weather;
  final Map dataOflocation;

  const WeatherPage(this.dataOflocation, this.datatime, this.weather, {super.key});

  String extractLocationEnds(String name) {
    List<String> parts = name.split(',').map((e) => e.trim()).toList();

    if (parts.length < 2) return name;

    String first = parts.first;
    String last = parts.last;

    return '$first,$last';
  }

  String dateTimeReturn(bool dateOrTime) {
    DateTime parsedDateTime = DateTime.parse(datatime);

    if (dateOrTime) {
      // Return only the date in yyyy-MM-dd format
      return "${parsedDateTime.year.toString().padLeft(4, '0')}-${parsedDateTime.month.toString().padLeft(2, '0')}-${parsedDateTime.day.toString().padLeft(2, '0')}";
    } else {
      // Return only the time in HH:mm:ss format
      return "${parsedDateTime.hour.toString().padLeft(2, '0')}:${parsedDateTime.minute.toString().padLeft(2, '0')}:${parsedDateTime.second.toString().padLeft(2, '0')}";
    }
  }

  AssetImage getWeatherAssetByTemperature(double temperatureCelsius) {
    if (temperatureCelsius <= 0) {
      return AssetImage("assets/images/snow.png");
    }else if (temperatureCelsius > 0 && temperatureCelsius <= 10) {
      return AssetImage("assets/images/heavyCold.png");
    }else if (temperatureCelsius > 10 && temperatureCelsius <= 20) {
      return AssetImage("assets/images/rainy.png");
    } else if (temperatureCelsius > 20 && temperatureCelsius <= 30) {
      return AssetImage("assets/images/warm.png");
    } else if (temperatureCelsius > 30) {
      return AssetImage("assets/images/sunny.png");
    }
    else {
      return AssetImage("assets/images/cloudy.png");
    }
  }


  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> data = [
      {
        "title": "Visibility",
        "value": "${(weather['visibility']==null)?"Not Available":weather['visibility']} km",
        "color": visibilityColor,
        "icon": Icons.remove_red_eye,
      },
      {
        "title": "Humidity",
        "value": "${(weather['humidity']==null)?"Not Available":weather['humidity']}%",
        "color": humidityColor,
        "icon": Icons.water_drop_outlined,
      },
      {
        "title": "Wind Speed",
        "value": "${(weather['windSpeed']==null)?"Not Available":weather['windSpeed']} m/s",
        "color": windSpeedColor,
        "icon": Icons.air,
      },
      {
        "title": "Dew Point",
        "value": "${(weather['dewPoint']==null)?"Not Available":weather['dewPoint']}°C",
        "color": dewPointColor,
        "icon": Icons.thermostat_outlined,
      },
      {
        "title": "Cloud Cover",
        "value": "${(weather['cloudCover']==null)?"Not Available":weather['cloudCover']}%",
        "color": cloudCoverColor,
        "icon": Icons.cloud_outlined,
      },
      {
        "title": "Pressure",
        "value": "${(weather['pressureSeaLevel']==null)?"Not Available":weather['pressureSeaLevel']} hPa",
        "color": pressureColor,
        "icon": Icons.speed_outlined,
      },
      {
        "title": "UV Index",
        "value": "${(weather['uvIndex']==null)?"Not Available":weather['uvIndex']}",
        "color": uvIndexColor,
        "icon": Icons.wb_sunny,
      },
      {
        "title": "Feels Like",
        "value": "${(weather['temperatureApparent']==null)?"Not Available":weather['temperatureApparent']}°C",
        "color": feelsLikeColor,
        "icon": Icons.device_thermostat,
      },
    ];

    return SizedBox(
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: containerPadding),
              child: Card(
                color: headerBackground,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(containerPadding * 2),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: <Widget>[
                      Spacer(),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: containerPadding*2),
                        child: Center(
                          child: Text(
                            extractLocationEnds(dataOflocation["name"]),
                            style: StyleforlargeText,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: containerPadding,horizontal: containerPadding*3),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle, // Ensures the border is also circular
                                  border: Border.all(
                                    color: Color(0xFFF8BBD5), // Choose your desired border color
                                    width: 4.0,         // Choose your desired border width
                                  ),
                                ),
                                margin: EdgeInsets.only(left: containerPadding*4),
                                  child:CircleAvatar(
                                    radius: containerPadding*5,
                                    backgroundImage: getWeatherAssetByTemperature(weather['temperature'].toDouble()),
                                  ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  children: [
                                    Text(
                                      "${weather['temperature']}°C",
                                      style: StyleforlargeText,
                                    ),
                                    Text(dateTimeReturn(false), style: StyleforsmallText),
                                    Text(dateTimeReturn(true), style: StyleforsmallText),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: containerPadding*2,)
                          ],
                        ),
                      ),
                      Spacer(),
                      // Text("${dataOflocation["lat"]} ${dataOflocation["lon"]}",style: StyleforsmallText,)
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(containerPadding),
              child: GridView.builder(
                itemCount: data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    color: data[index]["color"],
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            child: completeIconStyle(data[index]["icon"]),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                data[index]["title"],
                                style: StyleforlargeText,
                              ),
                              Text(
                                data[index]["value"],
                                style: StyleforValues,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
