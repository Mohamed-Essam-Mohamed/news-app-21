import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/sources_response.dart';

class Api {
//https://newsapi.org/v2/top-headlines/sources?apiKey=4a57deb62d754d21b2b98eca5ae85b3f&category=technology
  static Future<SourcesResponse> getSources() async {
    Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources", {
      "apiKey": "4a57deb62d754d21b2b98eca5ae85b3f",
    });
    var response = await http.get(url);
    String responseBody = response.body;
    var json = jsonDecode(responseBody);
    return SourcesResponse.fromJson(json);
  }

  //https://newsapi.org/v2/everything?q=bitcoin&apiKey=4a57deb62d754d21b2b98eca5ae85b3f
  static Future<NewsResponse> getNews() async {
    Uri url = Uri.https("newsapi.org", "/v2/everything", {
      "apiKey": "4a57deb62d754d21b2b98eca5ae85b3f",
    });
    var response = await http.get(url);
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    return NewsResponse.fromJson(json);
  }
}
