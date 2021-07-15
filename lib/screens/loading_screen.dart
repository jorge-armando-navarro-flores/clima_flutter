import 'package:clima_flutter/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async{
   Location location = Location();
   await location.getCurrentLocation();
   print(location.latitude);
   print(location.longitude);
  }

  void getData()async{
    http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=ead5d26ff3891f8f89fe2da6f9e1fba1'));

    if(response.statusCode == 200){
      String data  = response.body;
      print(data);
    }else{
      print(response.statusCode);
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }
  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            print("Location");
            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
