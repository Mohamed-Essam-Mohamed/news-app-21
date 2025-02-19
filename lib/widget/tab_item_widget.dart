import 'package:flutter/material.dart';
import 'package:news_app/model/sources_response.dart';

class TabItemWidget extends StatelessWidget {
  TabItemWidget({super.key, required this.source, required this.isSelected});
  Sources source;
  bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xff1877F2),
          width: 2,
        ),
        color: isSelected ? const Color(0xff1877F2) : Colors.transparent,
      ),
      child: Text(
        source.name ?? "",
        style: TextStyle(
          fontSize: 20,
          color: isSelected ? const Color(0xff202020) : Colors.white,
        ),
      ),
    );
  }
}
