import 'package:flutter/material.dart';
import 'package:news_app/api/api.dart';
import 'package:news_app/home_screen.dart';
import 'package:news_app/model/sources_response.dart';

void main() async {
  // Api api = Api();
  // SourcesResponse sourcesResponse = await api.getSources();
  // print(sourcesResponse.sources!.length);
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
