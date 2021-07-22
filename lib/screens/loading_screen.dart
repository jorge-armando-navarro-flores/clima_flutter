import 'package:clima_flutter/screens/location_screen.dart';
import 'package:clima_flutter/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';




class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  

  void getLocationData() async{
   WeatherModel weatherModel = WeatherModel();
   var weatherData = await weatherModel.getLocationWeather();

   Navigator.push(context, MaterialPageRoute(builder: (context){
     return LocationScreen(locationWeather: weatherData);
   }));

  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        )
      ),
    );
  }
}
