import 'package:flutter_bootcamp/src/config/appEnums.dart';
import 'package:flutter_bootcamp/src/news_feature/domain/entity/articleEntity.dart';
import 'package:flutter_bootcamp/src/news_feature/domain/repository/article_repository.dart';

class GetAllArticleUsecase {
  final ArticleRepository articleRepository;

  GetAllArticleUsecase({required this.articleRepository});

  Future<ArticleRequest> execute({required NewsFeedTabTypes type}) async {
    return await articleRepository.getAllArticleRequest(type: type);
  }
}
