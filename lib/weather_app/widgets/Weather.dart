import 'package:flutter/material.dart';
import 'package:flutter_mtap/weather_app/models/WeatherData.dart';
import 'package:intl/intl.dart';


class Weather extends StatelessWidget {
  final WeatherData? weather;

  Weather({Key? key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(weather!.name, style: new TextStyle(color: Colors.white)),
        Text(weather!.main, style: new TextStyle(color: Colors.white, fontSize: 32.0)),
        Text('${weather!.temp.toString()}°F',  style: new TextStyle(color: Colors.white)),
        Image.network('https://openweathermap.org/img/w/${weather!.icon}.png'),
        Text(new DateFormat.yMMMd().format(weather!.date), style: new TextStyle(color: Colors.white)),
        Text(new DateFormat.Hm().format(weather!.date), style: new TextStyle(color: Colors.white)),
      ],
    );
  }
}