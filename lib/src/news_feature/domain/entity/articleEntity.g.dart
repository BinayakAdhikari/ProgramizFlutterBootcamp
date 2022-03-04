// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articleEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Source _$SourceFromJson(Map<String, dynamic> json) => Source(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

ArticleEntity _$ArticleEntityFromJson(Map<String, dynamic> json) =>
    ArticleEntity(
      author: json['author'] as String,
      source: Source.fromJson(json['source'] as Map<String, dynamic>),
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      urlToImage: json['urlToImage'] as String,
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      content: json['content'] as String,
    );

Map<String, dynamic> _$ArticleEntityToJson(ArticleEntity instance) =>
    <String, dynamic>{
      'source': instance.source,
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt.toIso8601String(),
      'content': instance.content,
    };

ArticleRequestSuccess _$ArticleRequestSuccessFromJson(
        Map<String, dynamic> json) =>
    ArticleRequestSuccess(
      json['totalResults'] as int,
      (json['articles'] as List<dynamic>)
          .map((e) => ArticleEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$ArticleRequestSuccessToJson(
        ArticleRequestSuccess instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };

ArticleRequestFail _$ArticleRequestFailFromJson(Map<String, dynamic> json) =>
    ArticleRequestFail(
      status: json['status'] as String,
      code: json['code'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$ArticleRequestFailToJson(ArticleRequestFail instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
    };
