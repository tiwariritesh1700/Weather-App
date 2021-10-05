import 'dart:math';

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

    var city_name = [
      'Mumbai',
      'Delhi',
      'Banglore',
      'Chennai',
      'Dhar',
      'Indore',
      'London',
      'New york'
    ];

    Random random = Random();
    var city = city_name[random.nextInt(city_name.length)];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.blue,
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: blueLinearGradient(),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    InkWell(
                      child: Container(
                        child: Icon(
                          Icons.search,
                          color: Colors.blueAccent,
                        ),
                        padding: EdgeInsets.fromLTRB(3, 0, 7, 0),
                      ),
                      onTap: () {
                        print("Search me");
                      },
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Search $city'),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(26),
                      margin: EdgeInsets.symmetric(
                        horizontal: 24,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text('Hello I am Text'),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 300,
                      padding: EdgeInsets.all(26),
                      margin:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text('Hello I am Text'),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      height: 150,
                      padding: EdgeInsets.all(26),
                      margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text('Hello I am Text'),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 150,
                      padding: EdgeInsets.all(26),
                      margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text('Hello I am Text'),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    Text("Made By Ritesh"),
                    Text("Data Provided By Openweathermap.org")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  LinearGradient blueLinearGradient() {
    return LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [Colors.blue.shade800, Colors.blue.shade300]);
  }

  LinearGradient redOrangeLinearGradient() {
    return LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Colors.red, Colors.orange]);
  }

  LinearGradient redLinearGradient() {
    return LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Colors.red.shade800, Colors.red.shade300]);
  }

  LinearGradient orangeLinearGradient() {
    return LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Colors.orange.shade800, Colors.orange.shade300]);
  }

  LinearGradient orangeRedLinearGradient() {
    return LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Colors.orange, Colors.red]);
  }

  LinearGradient orangeRedLinearGradientWithStops() {
    return LinearGradient(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        colors: [
          Colors.orange,
          Colors.pinkAccent,
          Colors.blue,
        ],
        stops: [
          0.3,
          0.6,
          0.8,
        ]);
  }

  SweepGradient sweepGradient() {
    return SweepGradient(
        center: Alignment.centerRight,
        colors: [Colors.red.shade800, Colors.redAccent.shade400]);
  }

  RadialGradient radialGradient() {
    return RadialGradient(colors: [Colors.redAccent, Colors.blue]);
  }
}
