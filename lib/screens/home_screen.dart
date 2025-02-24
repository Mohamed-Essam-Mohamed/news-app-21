import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/api/api.dart';
import 'package:news_app/model/sources_response.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/widget/tab_container_widted.dart';
import 'package:news_app/widget/tab_item_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          "News App",
          style: TextStyle(
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.colorWhite,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      body: FutureBuilder<SourcesResponse>(
        future: Api.getSources(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "wrong",
                style: TextStyle(
                  fontSize: 30.sp,
                  color: AppColors.colorGrey,
                ),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
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
