import 'package:flutter_bootcamp/src/config/appEnums.dart';
import 'package:flutter_bootcamp/src/news_feature/domain/entity/articleEntity.dart';
import 'package:flutter_bootcamp/src/news_feature/domain/repository/article_repository.dart';
import 'package:flutter_bootcamp/src/news_feature/domain/usecase/get_all_article_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_all_article_usecase_test.mocks.dart';

@GenerateMocks([ArticleRepository])
void main() {
  late GetAllArticleUsecase getAllArticleUsecase;
  late MockArticleRepository mockArticleRepository;

  setUp(() {
    mockArticleRepository = MockArticleRepository();
    getAllArticleUsecase =
        GetAllArticleUsecase(articleRepository: mockArticleRepository);
  });

  final ArticleEntity articleEntity = ArticleEntity(
      source: Source(name: 'dip'),
      title: 'test',
      description: 'desc',
      url: 'http',
      urlToImage: 'test',
      publishedAt: DateTime.now(),
      content: 'hey');

  final ArticleRequest articleRequest =
      ArticleRequestSuccess(1, [articleEntity], status: 'success');

  test('Should get an article request when calling get Article usecase',
      () async {
    // arrange
    when(mockArticleRepository.getAllArticleRequest(
            type: NewsFeedTabTypes.featured))
        .thenAnswer((realInvocation) async => articleRequest);
    // act
    final result =
        await getAllArticleUsecase.execute(type: NewsFeedTabTypes.featured);
    // assert

    expectLater(result, articleRequest);
    // verify(mockArticleRepository.getAllArticleRequest(
    //     type: NewsFeedTabTypes.featured));
  });
}
