import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/api/api.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/sources_response.dart';
import 'package:news_app/widget/tab_item_widget.dart';
import 'package:shimmer/shimmer.dart';

import 'news_item_widget.dart';

class TabContainerWidget extends StatefulWidget {
  TabContainerWidget({super.key, required this.listSources});
  List<Sources> listSources;

  @override
  State<TabContainerWidget> createState() => _TabContainerWidgetState();
}

class _TabContainerWidgetState extends State<TabContainerWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.listSources.length,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            tabs: widget.listSources
                .map((source) => TabItemWidget(
                      source: source,
                      isSelected:
                          selectedIndex == widget.listSources.indexOf(source),
                    ))
                .toList(),
          ),
          FutureBuilder<NewsResponse>(
            future: Api.getNews(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "wrong",
                    style: TextStyle(
                      fontSize: 30.sp,
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
              var listNews = snapshot.data?.articles ?? [];
              return Expanded(
                child: ListView.separated(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  itemBuilder: (context, index) {
                    // return Image.network(listNews[index].urlToImage ??
                    //     "https://gizmodo.com/app/uploads/2025/02/GettyImages-2039371693.jpg");
                    return NewsItemWidget(
                      article: listNews[index],
                    );
                  },
                  itemCount: listNews.length,
                  separatorBuilder: (context, index) => Column(
                    children: [
                      SizedBox(height: 5.h),
                      Divider(
                        color: Colors.grey.shade600,
                        height: 10.h,
                        thickness: 2.sp,
                      ),
                      SizedBox(height: 5.h),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
