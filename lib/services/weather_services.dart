//fetching of data
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService{
  static const BASIC_URL = 'https://api.openweathermap.org/data/2.5/weather';
  final apiKey;

  WeatherService(
    this. apiKey
  );
  Future<Weather> getWeather(String cityValue) async{
    final response = await http.get(Uri.parse('$BASIC_URL?q=$cityValue&appid=$apiKey&units=metric'));
    if(response.statusCode == 200){
      return Weather.fromJson(jsonDecode(response.body));
    }
    else{
      throw Exception('Failed to Load Weather Data');
    }
  }
}