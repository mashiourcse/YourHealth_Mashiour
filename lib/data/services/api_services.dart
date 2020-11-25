import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yourhealth/data/models/country.dart';

class ApiService {
  static Future<Map<String, double>> getGlobalStat() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/all?yesterday');
    Map<String, dynamic> data;
    if (response.statusCode == 200) {
      data = json.decode(response.body);
      //print(data);
      int active = data['active'];
      int critical = data['critical'];
      int deaths = data['deaths'];
      int recovered = data['recovered'];
      Map<String, double> globalData = {
        "Active": active.toDouble(),
        "Critical": critical.toDouble(),
        "Deaths": deaths.toDouble(),
        "Recovered": recovered.toDouble()
      };
      return globalData;
    } else {
      print(response.statusCode);
      return null;
    }
  }

  static Future<List<Country>> getCountryStat() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries');

    List<dynamic> data;
    if (response.statusCode == 200) {
      data = json.decode(response.body);
      //print(data);
      List<Country> countryList = data.map((e) {
        return Country(
            name: e['country'],
            cases: e['cases'],
            active: e['active'],
            critical: e['critical'],
            deaths: e['deaths'],
            recovered: e['recovered'],
            image: e['countryInfo']['flag']);
      }).toList();
      //print(countryList);
      return countryList;
    } else {
      print(response.statusCode);
      return null;
    }
  }
}
