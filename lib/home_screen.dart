import 'package:flutter/material.dart';
import 'package:news_app/api/api.dart';
import 'package:news_app/model/sources_response.dart';
import 'package:news_app/widget/tab_container_widted.dart';
import 'package:news_app/widget/tab_item_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff202020),
      appBar: AppBar(
        title: const Text(
          "News App",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff1877F2),
        centerTitle: true,
      ),
      body: FutureBuilder<SourcesResponse>(
        future: Api.getSources(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text(
                "wrong",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.grey,
                ),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xff1877F2),
              ),
            );
          }
          var listSources = snapshot.data?.sources ?? [];
          return TabContainerWidget(listSources: listSources);
        },
      ),
    );
  }
}
