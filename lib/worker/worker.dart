import 'dart:convert';

import 'package:http/http.dart';
import 'package:logger/logger.dart';

class Worker {
  //Variables
  late String cityName;
  late String temp;
  late String humidity;
  late String air_speed;
  late String description;

  //Costructor

  Worker({required this.cityName}){
   this.cityName = cityName;
  }

//get method for weather api to fetch data

  Future<void> getData() async {
    //Weather App Url
    String weatherUrl =
        "https://api.openweathermap.org/data/2.5/weather?q=$cityName%20&appid=e1a1a30eca176ae42c8e3e3c6f3bb8ff";

    try {
      Response response = await get(Uri.parse(weatherUrl));
      Map rawData = jsonDecode(response.body);

      //Used logger package to print data in console in better way
      Logger logger = Logger();
      logger.i(rawData);
      // logger.log(Logger.level,rawData);
      // logger.i(rawData);
      // logger.e(rawData);
      // logger.w(rawData);
      // logger.v(rawData);
      // logger.wtf(rawData);

      //setting data to variables
      List weatherData = rawData["weather"];
      Map weather_data_description = weatherData[0];
      description = weather_data_description["description"].toString();

      Map weatherMain = rawData["main"];
      temp = weatherMain["temp"].toString();
      humidity = weatherMain["humidity"].toString();

      Map weatherWind = rawData["wind"];
      air_speed = weatherWind['speed'].toString();
    } catch (e) {
      temp ="Can't find data";
      humidity ="Can't find data";
      description ="Can't find data";
      air_speed ="Can't find data";
      print(e);
    }
  }
}
