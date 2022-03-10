import 'package:flutter_bootcamp/src/config/appEnums.dart';
import 'package:flutter_bootcamp/src/news_feature/domain/entity/articleEntity.dart';
import 'package:flutter_bootcamp/src/service/http_service.dart';

abstract class ArticleDatasource {
  final HttpService httpService;
  ArticleDatasource({required this.httpService});

  Future<ArticleRequest> getAllArticles({required NewsFeedTabTypes tab});
}

class ArticleDatasourceImp extends ArticleDatasource {
  ArticleDatasourceImp({required HttpService httpService})
      : super(httpService: httpService);

  @override
  Future<ArticleRequest> getAllArticles({required NewsFeedTabTypes tab}) async {
    final result = await httpService.getArticles(type: tab);

    return result;
  }
}
