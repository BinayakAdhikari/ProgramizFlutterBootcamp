// ignore: file_names

import 'package:json_annotation/json_annotation.dart';
part 'articleEntity.g.dart';

abstract class ArticleRequest {
  final String status;

  ArticleRequest({required this.status});
}

@JsonSerializable()
class Source {
  final String? id;
  final String name;

  Source({this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> data) => _$SourceFromJson(data);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}

@JsonSerializable()
class ArticleEntity {
  final Source source;
  final String? author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;

  ArticleEntity({
    this.author,
    required this.source,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory ArticleEntity.fromJson(Map<String, dynamic> data) =>
      _$ArticleEntityFromJson(data);

  Map<String, dynamic> toJson() => _$ArticleEntityToJson(this);
}

@JsonSerializable()
class ArticleRequestSuccess extends ArticleRequest {
  final int totalResults;
  final List<ArticleEntity> articles;
  ArticleRequestSuccess(this.totalResults, this.articles,
      {required String status})
      : super(status: status);

  factory ArticleRequestSuccess.fromJson(Map<String, dynamic> data) =>
      _$ArticleRequestSuccessFromJson(data);

  Map<String, dynamic> toJson() => _$ArticleRequestSuccessToJson(this);
}

@JsonSerializable()
class ArticleRequestFail extends ArticleRequest {
  final String code;
  final String message;
  ArticleRequestFail({
    required String status,
    required this.code,
    required this.message,
  }) : super(status: status);

  factory ArticleRequestFail.fromJson(Map<String, dynamic> data) =>
      _$ArticleRequestFailFromJson(data);

  Map<String, dynamic> toJson() => _$ArticleRequestFailToJson(this);
}
