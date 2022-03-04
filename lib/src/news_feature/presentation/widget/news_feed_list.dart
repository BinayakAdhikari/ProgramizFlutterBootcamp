import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/src/config/appConfig.dart';
import 'package:flutter_bootcamp/src/news_feature/domain/entity/articleEntity.dart';

import '../../../utils/news_feature_util.dart';

class NewsFeedList extends StatelessWidget {
  final ArticleRequestSuccess articleRequestSuccess;
  final Function(ArticleEntity articleEntity) itemTouchCallback;
  const NewsFeedList({
    Key? key,
    required this.articleRequestSuccess,
    required this.itemTouchCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double individualAritcleHeight =
        MediaQuery.of(context).size.height / 8;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: ListView.builder(
            itemCount: articleRequestSuccess.articles.length,
            itemBuilder: (BuildContext context, int index) {
              return _individualArticleRow(
                widgetHeight: individualAritcleHeight,
                articleEntity: articleRequestSuccess.articles[index],
                touchCallback: (ArticleEntity articleEntity) {
                  itemTouchCallback(articleEntity);
                },
              );
            }),
      ),
    );
  }

  Widget _individualArticleRow({
    required double widgetHeight,
    required ArticleEntity articleEntity,
    required Function(ArticleEntity) touchCallback,
  }) {
    return InkWell(
      onTap: () {
        touchCallback(articleEntity);
      },
      child: Container(
        height: widgetHeight,
        margin: EdgeInsets.only(
          bottom: widgetHeight / 10,
        ),
        child: Row(
          children: [
            SizedBox(
              height: widgetHeight,
              width: widgetHeight * 1.3,
              child: Image.network(
                articleEntity.urlToImage,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      articleEntity.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: AppConfig().themeData.textTheme.headline4,
                    ),
                    Text(
                      "${getPrettyDate(date: articleEntity.publishedAt)} • ${getEstimateReadTime(words: articleEntity.content)} min",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: AppConfig().themeData.textTheme.headline6,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
