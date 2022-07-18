import 'package:clima/services/networking.dart';
import 'location.dart';
import 'package:clima/screens/location_screen.dart';
const lapi="api.openweathermap.org";
const lapitype="/data/2.5/weather";
const apikey='8eb391424e3f9ac018ffa7c439442785';

class WeatherModel {
  String latitude;
  String longitude;
  Map<String,dynamic> lquery;
  Map<String,dynamic> cquery;

  Future<dynamic> getcityweather(String cityname)async{
    cquery={"q":cityname,"appid":apikey,"units":"metric"};
    NetworkHelper networkHelper=NetworkHelper(lapi, lapitype, cquery);
    var cityweatherdata= await networkHelper.getData();
    return cityweatherdata;
  }


  Future<dynamic> getweatherdata()async{
    Location location=Location();
    await location.getlocation();
    latitude=location.latitude.toString();
    longitude=location.longitude.toString();
    lquery={"lat":latitude,"lon":longitude,"appid":apikey,"units":"metric"};
    NetworkHelper networkHelper=NetworkHelper(lapi,lapitype,lquery);
    var weatherdata= await networkHelper.getData();
    return weatherdata;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
