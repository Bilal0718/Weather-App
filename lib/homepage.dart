import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';
import 'package:weather_app/widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WeatherService _weatherService = WeatherService('2eea6efcc5a37912ec7dfccf3aa7948f');
  String _selectedCity = "Karachi";

  String getWeatherAnimation(String? mainCondition){
    if(mainCondition == null) return 'assets/sunny.json';
    
    switch(mainCondition.toLowerCase()){
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/cloudy.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/rainy.json';
      case 'thunderstorm':
        return 'assets/thunderstorm.json';
      case 'clear':
        return 'assets/sunny.json';
      default:
        return 'assets/sunny.json';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CityPicker(
                  onCityChanged: (city) {
                    setState(() {
                      _selectedCity = city ?? "Karachi";
                    });
                  },
                ),
                FutureBuilder<Weather>(
                  future: _weatherService.getWeather(_selectedCity),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      return Column(
                        children: [
                          Text(snapshot.data!.cityValue),
                          
                          Lottie.asset(getWeatherAnimation(snapshot.data!.mainCondition)),

                          Text("${snapshot.data!.temperature.round()}°C"),

                          Text(snapshot.data!.mainCondition),

                        ],
                      );
                    } else {
                      return const Text("Loading weather data...");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
