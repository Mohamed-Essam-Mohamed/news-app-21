import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/api/api.dart';
import 'package:news_app/screens/home_screen.dart';
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
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        );
      },
    );
  }
}
