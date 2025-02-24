import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/main.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/screens/web_view_screen.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/widget/chached_newtwork_image_widget.dart';

class ArticleDelScreen extends StatelessWidget {
  const ArticleDelScreen({super.key, required this.article});
  final Articles article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        iconTheme: const IconThemeData(color: AppColors.colorWhite),
        title: Text(
          article.author ?? "",
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColors.colorWhite,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            CachedNetworkImageWidget(imageUrl: article.urlToImage ?? ""),
            SizedBox(height: 13.h),
            Text(
              article.title ?? "",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.colorWhite,
              ),
            ),
            const SizedBox(height: 13),
            Text(
              article.description ?? "",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w300,
                color: AppColors.colorWhite,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: MaterialButton(
        color: AppColors.primaryColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => WebViewScreen(url: article.url ?? ""),
          ));
        },
        child: Text(
          "View Full Article",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
