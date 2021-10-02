import 'package:flutter/material.dart';
import 'package:weather_app/worker/worker.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    Object? homeValue = ModalRoute.of(context)!.settings.arguments;
    print(homeValue);
    Map homeValuee = homeValue as Map;
    return Scaffold( body:SafeArea(
      child: Container(
        child: Center(
          child: Text(homeValuee["description"]),
        ),
      ),
    ),);
  }

  @override
  void initState() {
    super.initState();


  }
}
