import 'package:flutter/material.dart';
import 'package:news_app/model/sources_response.dart';
import 'package:news_app/widget/tab_item_widget.dart';

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
      child: TabBar(
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
    );
  }
}
