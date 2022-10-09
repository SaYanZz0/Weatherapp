
import '../api/api_repository.dart';
import '../model/current_weather_data.dart';
import '../model/models/five_days_data.dart';
class WeatherService {
  final String city;

  String baseUrl = 'https://api.openweathermap.org/data/2.5';
  String apiKey = 'appid=49222d66be8fb82b55d7e3f0f25eb3a4';

  WeatherService({required this.city});

  void getCurrentWeatherData({
    required Function() beforSend,
    required Function(CurrentWeatherData currentWeatherData) onSuccess,
    required Function(dynamic error) onError,
  }) {
    final url = '$baseUrl/weather?q=$city&lang=en&$apiKey';
    //print(url);
    ApiRepository(url: '$url', payload: null).get(
        beforeSend: () => {
          if (beforSend != null)
            {
              beforSend(),
            },
        },
        onSuccess: (data) => {
          onSuccess(CurrentWeatherData.fromJson(data)),
        },
        onError: (error) => {
          if (onError != null)
            {
              print(error),
              onError(error),
            }
        });
  }

  void getFiveDaysThreeHoursForcastData({
    required Function() beforSend,
    required Function(List<FiveDayData> fiveDayData) onSuccess,
    required Function(dynamic error) onError,
  }) {
    final url = '$baseUrl/forecast?q=$city&lang=en&$apiKey';
    print(url);
    ApiRepository(url: url, payload: null).get(
        beforeSend: () => {},
        onSuccess: (data) => {
          onSuccess((data['list'] as List)
              .map((t) => FiveDayData.fromJson(t))
              .toList()),
        },
        onError: (error) => {
          print(error),
          onError(error),
        });
  }
}