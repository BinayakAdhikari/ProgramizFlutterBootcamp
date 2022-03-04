import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/src/config/appConfig.dart';

import '../../../config/appEnums.dart';

class NewsFeedTabs extends StatefulWidget {
  final NewsFeedTabTypes initialTab;
  final Function(NewsFeedTabTypes) tabClickCallBack;
  const NewsFeedTabs({
    Key? key,
    required this.tabClickCallBack,
    required this.initialTab,
  }) : super(key: key);

  @override
  State<NewsFeedTabs> createState() => _NewsFeedTabsState();
}

class _NewsFeedTabsState extends State<NewsFeedTabs> {
  late NewsFeedTabTypes selectedTab;

  @override
  void initState() {
    super.initState();
    selectedTab = widget.initialTab;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        individualTab(
          type: NewsFeedTabTypes.featured,
          callback: (NewsFeedTabTypes type) {
            widget.tabClickCallBack(type);
          },
        ),
        individualTab(
          type: NewsFeedTabTypes.latest,
          callback: (NewsFeedTabTypes type) {
            widget.tabClickCallBack(type);
          },
        ),
        individualTab(
          type: NewsFeedTabTypes.trending,
          callback: (NewsFeedTabTypes type) {
            widget.tabClickCallBack(type);
          },
        ),
      ],
    );
  }

  Widget individualTab({
    required NewsFeedTabTypes type,
    required Function(NewsFeedTabTypes type) callback,
  }) {
    late String title;
    late TextAlign align;
    bool selected = (type == selectedTab);
    switch (type) {
      case NewsFeedTabTypes.featured:
        title = "Featured";
        align = TextAlign.start;
        break;
      case NewsFeedTabTypes.latest:
        title = "Latest";
        align = TextAlign.center;
        break;
      case NewsFeedTabTypes.trending:
        title = "Trending";
        align = TextAlign.end;
        break;
      default:
        title = "Error";
        break;
    }

    return Expanded(
      child: InkWell(
        onTap: () {
          callback(type);
          setState(() {
            selectedTab = type;
          });
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            title,
            textAlign: align,
            style: selected
                ? TextStyle(
                    fontSize:
                        AppConfig().themeData.textTheme.headline2!.fontSize,
                    fontWeight:
                        AppConfig().themeData.textTheme.headline2!.fontWeight,
                    color: primary,
                  )
                : TextStyle(
                    fontSize:
                        AppConfig().themeData.textTheme.headline2!.fontSize,
                    fontWeight: FontWeight.w500,
                    color: greyLighter,
                  ),
          ),
        ),
      ),
    );
  }
}
