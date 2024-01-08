import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import 'weather_model.dart';

part 'weather_service.g.dart';

@RestApi(baseUrl: 'https://api.openweathermap.org/data/2.5')
abstract class WeatherService {
  factory WeatherService(Dio dio, {String baseUrl}) = _WeatherService;

  @GET('/weather')
  Future<WeatherData> getWeather(
      @Query('q') String city,
      @Query('appid') String apiKey,
      @Query('units') String units,
      @Query('lang') String lang,
      );
}