import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/cupertino.dart';

const apiKey = '2fe35fe9fc6d3a0b1c15a5de092d08ff';

class WeatherModel {
  Future getCityData(String cityName) async {
    Networking network = Networking(
        url:
            'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await network.parseData();
    return weatherData;
  }

  Future<dynamic> getWeatherData() async {
    Location location = Location();
    await location.getLocation();
    Networking network = Networking(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await network.parseData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }

  String getGif(int condition) {
    if (condition < 300) {
      return 'https://media.giphy.com/media/13ZEwDgIZtK1y/source.gif';
    } else if (condition < 400) {
      return 'https://media.giphy.com/media/3o7at59KDANvJrUDbG/source.gif';
    } else if (condition < 600) {
      return 'https://media.giphy.com/media/t7Qb8655Z1VfBGr5XB/giphy.gif';
    } else if (condition < 700) {
      return 'https://media.giphy.com/media/l2Je9dUI5LpzfHGTe/giphy.gif';
    } else if (condition < 800) {
      return 'https://media.giphy.com/media/JOMTYlr1b2HlxGXyoS/giphy.gif';
    } else if (condition == 800) {
      return 'https://media.giphy.com/media/U1mIZ4n38Jh6k0hAPT/giphy.gif';
    } else if (condition <= 804) {
      return 'https://media.giphy.com/media/Yl5QvMg3Zxfe9g6HvM/giphy-downsized-large.gif';
    } else {
      return 'https://media.giphy.com/media/zI2xxBtbAig6Y/source.gifโ';
    }
  }
}
