class WeatherData {
  final String city;
  final String temperature;
  final String humidity;
  final String status;

  WeatherData({
    required this.city,
    required this.temperature,
    required this.humidity,
    required this.status,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      city: json['name'],
      temperature: json['main']['temp'].toString(),
      humidity: json['main']['humidity'].toString(),
      status: json['weather'][0]['description'],
    );
  }
}