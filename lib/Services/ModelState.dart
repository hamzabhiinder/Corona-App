import 'dart:convert';

import 'package:corona_appfull/Model/CountriesModel.dart';
import 'package:corona_appfull/Model/worldStateApi.dart';
import 'package:corona_appfull/Services/Appurl.dart';
import 'package:http/http.dart' as http;

class StateService {
  Future<WorldStateModel> getWorldRecord() async {
    final response = await http.get(Uri.parse(AppUrl.WorldStateApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      return WorldStateModel.fromJson(data);
    } else {
      throw (e) {
        print(e.toString());
      };
    }
  }

  Future<List<dynamic>> getCountriesRecord() async {
    var data;
    final response = await http.get(Uri.parse(AppUrl.country));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());

      return data;
    } else {
      throw (e) {
        print(e.toString());
      };
    }
  }
}
