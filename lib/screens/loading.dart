import 'package:flutter/material.dart';
import 'package:weather_app/worker/worker.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //Variables
  late String cityName;
  late String temp;
  late String humidity;
  late String air_speed;
  late String description;

  String temprature ="Loading";
  loadWeatherData() async{
    Worker worked = Worker(cityName: "Mumbai");
    await worked.getData();
    cityName = worked.cityName;
    temp = worked.temp;
    humidity = worked.humidity;
    air_speed = worked.air_speed;
    description = worked.description;

    Navigator.pushReplacementNamed(context, "/home",arguments: {
      "city":cityName,
      "temp":temp,
      "humidity":humidity,
      "air_speed":air_speed,
      "description":description,
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextButton.icon(onPressed: (){
              Navigator.pushNamed(context, "/home");
            }, icon:Icon(Icons.add_to_home_screen) ,label: Text(temprature),)
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    loadWeatherData();
  }
}
