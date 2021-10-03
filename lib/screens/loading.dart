import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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

    Future.delayed(Duration(seconds: 2),(){
      print("entred here ");
        Navigator.pushReplacementNamed(context, "/home",arguments: {
          "city":cityName,
          "temp":temp,
          "humidity":humidity,
          "air_speed":air_speed,
          "description":description,
        });
    });



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset("images/mlogo.png",height: 240,width: 240,),
           Text('Mausam App',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: Colors.white),),
            SizedBox(height: 10,),
            Text('Made By Ritesh',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.white)),
            SizedBox(height: 30,),
            SpinKitWave(
              color: Colors.white,
              size: 50.0,
            )

          ],
        ),
      ),
      backgroundColor: Colors.blue[300],
    );
  }

  @override
  void initState() {
    super.initState();
    loadWeatherData();
  }
}
