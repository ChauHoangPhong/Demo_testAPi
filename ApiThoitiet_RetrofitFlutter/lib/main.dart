import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'weather_model.dart';
import 'weather_service.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  final WeatherService weatherService =
  WeatherService(Dio(), baseUrl: 'https://api.openweathermap.org/data/2.5');

  final String apiKey = '8b3361be8f3dd3cc9cf5961f4fa20231';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Weather App')),
        body: Center(
          child: FutureBuilder<WeatherData>(
            future: weatherService.getWeather(
              'Hanoi',
              apiKey,
              'metric',
              'vi',
            ),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final weather = snapshot.data!;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Thành phố: ${weather.city}',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Nhiệt độ: ${weather.temperature}°C',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Độ ẩm: ${weather.humidity}%',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Tình trạng thời tiết: ${weather.status}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 16),
                    Icon(Icons.wb_sunny, size: 100, color: Colors.yellow),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text(
                  'Lỗi: ${snapshot.error}',
                  style: TextStyle(fontSize: 18, color: Colors.red),
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}