import 'dart:convert';

import 'package:flutter_bootcamp/src/config/appConfig.dart';
import 'package:flutter_bootcamp/src/config/appEnums.dart';
import 'package:flutter_bootcamp/src/news_feature/domain/entity/articleEntity.dart';
import 'package:http/http.dart' as http;

class HttpService {
  //! Just Trying out
  final ReleaseTypes type;

  HttpService({required this.type});

  //! Check production type
  /// For generating uri
  /// routeName should be clean
  /// eg, "everything" not "/everything" or "/everything/"
  ///
  /// parameter should be clean
  /// eg, "q=apple&from=2022-03-03&to=2022-03-03&sortBy=popularity&apiKey=325347257cd840a4ac26b3627d78d8ae" not "?q=apple&from=2022-03-03&to=2022-03-03&sortBy=popularity&apiKey=325347257cd840a4ac26b3627d78d8ae"
  Uri _getEndpointUri({required String routeName, String? parameter}) {
    String urlRaw;

    switch (type) {
      case ReleaseTypes.dev:
        urlRaw = baseUrl;
        break;
      case ReleaseTypes.release:
        urlRaw = "";
        break;
      default:
        urlRaw = baseUrl;
    }
    return Uri.parse("$urlRaw/$routeName?${(parameter ?? '')}");
  }

  // Get All articles get request
  Future<ArticleRequest> getArticles({required NewsFeedTabTypes type}) async {
    late String routeName;
    late String? parameter;
    switch (type) {
      case NewsFeedTabTypes.featured:
        routeName = 'everything';
        parameter =
            'q=apple&from=2022-03-03&to=2022-03-03&sortBy=popularity&apiKey=325347257cd840a4ac26b3627d78d8ae';
        break;
      case NewsFeedTabTypes.latest:
        routeName = 'everything';
        parameter =
            'q=tesla&from=2022-02-04&sortBy=publishedAt&apiKey=325347257cd840a4ac26b3627d78d8ae';
        break;
      case NewsFeedTabTypes.trending:
        routeName = 'top-headlines';
        parameter =
            'country=us&category=business&apiKey=325347257cd840a4ac26b3627d78d8ae';
        break;
      default:
        routeName = 'everything';
        break;
    }
    Uri uri = _getEndpointUri(routeName: routeName, parameter: parameter);

    http.Response response = await http.get(uri);
    var decodedJson = jsonDecode(
      response.body,
    );
    if (decodedJson['status'] == 'ok') {
      return ArticleRequestSuccess.fromJson(decodedJson);
    } else {
      return ArticleRequestFail.fromJson(decodedJson);
    }
  }
}
