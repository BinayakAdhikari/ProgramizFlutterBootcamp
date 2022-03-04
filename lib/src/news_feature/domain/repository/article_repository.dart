import 'package:flutter_bootcamp/src/config/appEnums.dart';
import 'package:flutter_bootcamp/src/news_feature/domain/entity/articleEntity.dart';

abstract class ArticleRepository {
  Future<ArticleRequest> getAllArticleRequest({required NewsFeedTabTypes type});
}
