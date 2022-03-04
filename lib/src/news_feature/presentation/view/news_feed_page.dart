import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/src/config/appConfig.dart';
import 'package:flutter_bootcamp/src/config/appEnums.dart';
import 'package:flutter_bootcamp/src/core/presentation/widget/search_bar.dart';
import 'package:flutter_bootcamp/src/news_feature/data/datasource/article_datasource.dart';
import 'package:flutter_bootcamp/src/news_feature/data/repository/article_repository_imp.dart';
import 'package:flutter_bootcamp/src/news_feature/domain/entity/articleEntity.dart';
import 'package:flutter_bootcamp/src/news_feature/domain/usecase/get_all_article_usecase.dart';
import 'package:flutter_bootcamp/src/news_feature/presentation/view/news_details_page.dart';
import 'package:flutter_bootcamp/src/news_feature/presentation/widget/news_feed_header.dart';
import 'package:flutter_bootcamp/src/news_feature/presentation/widget/news_feed_list.dart';
import 'package:flutter_bootcamp/src/news_feature/presentation/widget/news_feed_tabs.dart';
import 'package:flutter_bootcamp/src/service/http_service.dart';

class NewsFeedPage extends StatefulWidget {
  const NewsFeedPage({Key? key}) : super(key: key);

  @override
  State<NewsFeedPage> createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  NewsFeedTabTypes selectedTab = NewsFeedTabTypes.featured;

  late Future<ArticleRequest> getAllArticleUsecase;

  @override
  void initState() {
    getAllArticleUsecase = GetAllArticleUsecase(
      articleRepository: ArticleRepositroyImp(
        articleDatasourceImp: ArticleDatasourceImp(
          httpService: HttpService(
            type: ReleaseTypes.dev,
          ),
        ),
      ),
    ).execute(type: selectedTab);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 12.0,
          ),
          child: _newsFeedView(),
        ),
      ),
    );
  }

  Widget _newsFeedView() {
    return Column(
      children: [
        const NewsFeedHeader(),
        const Padding(
          padding: EdgeInsets.only(bottom: 24.0),
        ),
        const SearchBar(),
        const Padding(
          padding: EdgeInsets.only(bottom: 24.0),
        ),
        NewsFeedTabs(
          tabClickCallBack: (NewsFeedTabTypes tab) {
            setState(() {
              selectedTab = tab;
              getAllArticleUsecase = GetAllArticleUsecase(
                articleRepository: ArticleRepositroyImp(
                  articleDatasourceImp: ArticleDatasourceImp(
                    httpService: HttpService(
                      type: ReleaseTypes.dev,
                    ),
                  ),
                ),
              ).execute(type: selectedTab);
            });
          },
          initialTab: selectedTab,
        ),
        FutureBuilder(
          future: getAllArticleUsecase,
          builder:
              (BuildContext context, AsyncSnapshot<ArticleRequest> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data is ArticleRequestSuccess) {
                return NewsFeedList(
                  articleRequestSuccess:
                      (snapshot.data as ArticleRequestSuccess),
                  itemTouchCallback: (ArticleEntity articleEntity) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => NewsDetailsPage(
                              articleEntity: articleEntity,
                            )),
                      ),
                    );
                  },
                );
              } else {
                return Expanded(
                  child: Center(
                    child: Text(
                      (snapshot.data as ArticleRequestFail).message,
                      style: AppConfig().themeData.textTheme.headline4,
                    ),
                  ),
                );
              }
            } else {
              return const Expanded(
                child: Center(
                  child: CircularProgressIndicator(
                    color: primary,
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
