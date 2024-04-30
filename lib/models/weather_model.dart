class Weather {
  final String cityValue;
  final double temperature;
  final String mainCondition;

  Weather(
      {required this.cityValue,
      required this.temperature,
      required this.mainCondition});

  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(
      cityValue: json['name'], 
      temperature: json['main']['temp'].toDouble(), 
      mainCondition: json['weather'][0]['main']
      );
  }
}
