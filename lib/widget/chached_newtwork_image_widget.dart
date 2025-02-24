import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/shimmer_loading_widget.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  const CachedNetworkImageWidget({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
        height: 200,
        width: double.infinity,
        fit: BoxFit.cover,
        imageUrl: imageUrl,
        placeholder: (context, url) => const ShimmerLoadingWidget(
          height: 200,
          width: double.infinity,
        ),
        errorWidget: (context, url, error) => const ShimmerLoadingWidget(
          height: 200,
          width: double.infinity,
        ),
      ),
    );
  }
}
