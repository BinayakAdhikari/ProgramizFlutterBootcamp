import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/src/config/appConfig.dart';

class NewsDetailsBody extends StatelessWidget {
  final String title;
  final String content;

  const NewsDetailsBody({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text(
              title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: AppConfig().themeData.textTheme.headline4,
            ),
            const Padding(
              padding: EdgeInsets.only(
                bottom: 12,
              ),
            ),
            Flexible(
              child: Text(
                content + content + content,
                overflow: TextOverflow.clip,
                style: AppConfig().themeData.textTheme.bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
