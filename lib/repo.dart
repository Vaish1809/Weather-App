import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/datamodel.dart';

class Repo {
  getWeather(String city) async {
    var url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=43ea6baaad7663dc17637e22ee6f78f2";
    final response = await http
        .get(Uri.parse(url)); //converts url to correct form and sends to http
    try {
      if (response.statusCode == 200) {
        return WeatherModel.fromJson(json.decode(response.body));
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
