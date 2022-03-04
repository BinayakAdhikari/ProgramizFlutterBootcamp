import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/src/config/appConfig.dart';
import 'package:flutter_bootcamp/src/news_feature/domain/entity/articleEntity.dart';
import 'package:flutter_bootcamp/src/news_feature/presentation/widget/news_details_body.dart';
import 'package:flutter_bootcamp/src/news_feature/presentation/widget/news_details_image_frame.dart';

class NewsDetailsPage extends StatefulWidget {
  final ArticleEntity articleEntity;
  const NewsDetailsPage({Key? key, required this.articleEntity})
      : super(key: key);

  @override
  State<NewsDetailsPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailsPage> {
  bool isReadAll = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: _newsDetailsView(),
      ),
    );
  }

  Widget _newsDetailsView() {
    return SingleChildScrollView(
      physics: isReadAll
          ? const BouncingScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            NewsDetailsImageFrame(
              imageUrl: widget.articleEntity.urlToImage,
              readAllCallback: () {
                setState(() {
                  isReadAll = true;
                });
              },
              isReadAll: isReadAll,
            ),
            NewsDetailsBody(
              title: widget.articleEntity.title,
              content: widget.articleEntity.content,
            ),
          ],
        ),
      ),
    );
  }
}
