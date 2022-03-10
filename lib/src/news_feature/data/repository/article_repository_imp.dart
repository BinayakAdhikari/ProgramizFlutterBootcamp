import 'package:flutter_bootcamp/src/news_feature/data/datasource/article_datasource.dart';
import 'package:flutter_bootcamp/src/news_feature/domain/entity/articleEntity.dart';
import 'package:flutter_bootcamp/src/config/appEnums.dart';
import 'package:flutter_bootcamp/src/news_feature/domain/repository/article_repository.dart';

class ArticleRepositroyImp extends ArticleRepository {
  final ArticleDatasourceImp articleDatasourceImp;

  ArticleRepositroyImp({required this.articleDatasourceImp});
  //
  @override
  Future<ArticleRequest> getAllArticleRequest(
      {required NewsFeedTabTypes type}) async {
    return await articleDatasourceImp.getAllArticles(tab: type);
  }
}
