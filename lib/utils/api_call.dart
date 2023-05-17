import 'dart:convert';

import 'package:digipaper/models/latest_news_model.dart';
import 'package:digipaper/utils/app_constraints.dart';
import 'package:http/http.dart' as http;

class ApiCall{

  static Future<LatestNews> apicall() async {
    http.Response response;
    response = await http.get(
      Uri.parse(
          '${AppConstants.BASE_URL}'),
    );
    //List<dynamic> data = jsonDecode( utf8.decode(response.body.toString() as List<int>));
    var data = json.decode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      return LatestNews.fromJson(data);
    } else {
      return LatestNews.fromJson(data);
    }
  }
}