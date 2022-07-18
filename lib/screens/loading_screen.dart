import 'package:clima/services/location.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'location_screen.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getloactiondata();

  }

  void getloactiondata() async {
   WeatherModel weatherModel=WeatherModel();
   var weatherdata= await weatherModel.getweatherdata();
   Navigator.push(context,MaterialPageRoute(builder: (context){
     return LocationScreen(weatherdata);
   }));

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.pink,
        ),
      )
    );
  }
}
