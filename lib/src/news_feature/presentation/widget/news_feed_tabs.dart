import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/src/config/appConfig.dart';

import '../../../config/appEnums.dart';

class NewsFeedTabs extends StatelessWidget {
  final Function(NewsFeedTabTypes) tabClickCallBack;
  const NewsFeedTabs({
    Key? key,
    required this.tabClickCallBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        individualTab(
          type: NewsFeedTabTypes.featured,
          selected: true,
          callback: (NewsFeedTabTypes type) {},
        ),
        individualTab(
          type: NewsFeedTabTypes.latest,
          callback: (NewsFeedTabTypes type) {},
        ),
        individualTab(
          type: NewsFeedTabTypes.trending,
          callback: (NewsFeedTabTypes type) {},
        ),
      ],
    );
  }

  Widget individualTab({
    required NewsFeedTabTypes type,
    bool selected = false,
    required Function(NewsFeedTabTypes type) callback,
  }) {
    late String title;
    late TextAlign align;
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
        },
        child: Text(
          title,
          textAlign: align,
          style: selected
              ? AppConfig().themeData.textTheme.headline2
              : TextStyle(
                  fontSize: AppConfig().themeData.textTheme.headline2!.fontSize,
                  fontWeight: FontWeight.w500,
                  color: greyLighter,
                ),
        ),
      ),
    );
  }
}
