import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/screens/article_del_screen.dart';
import 'package:news_app/widget/chached_newtwork_image_widget.dart';
import 'package:news_app/screens/shimmer_loading_widget.dart';
import 'package:shimmer/shimmer.dart';

class NewsItemWidget extends StatelessWidget {
  const NewsItemWidget({super.key, required this.article});
  final Articles article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ArticleDelScreen(article: article),
          ),
        );
      },
      child: Column(
        children: [
          CachedNetworkImageWidget(
            imageUrl: article.urlToImage ?? "",
          ),
          const SizedBox(height: 6),
          Text(
            article.title ?? "",
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
