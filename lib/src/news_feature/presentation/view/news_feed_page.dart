import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/src/config/appConfig.dart';
import 'package:flutter_bootcamp/src/config/appEnums.dart';
import 'package:flutter_bootcamp/src/core/presentation/widget/search_bar.dart';
import 'package:flutter_bootcamp/src/news_feature/domain/entity/articleEntity.dart';
import 'package:flutter_bootcamp/src/news_feature/presentation/view/news_details_page.dart';
import 'package:flutter_bootcamp/src/news_feature/presentation/widget/news_feed_header.dart';
import 'package:flutter_bootcamp/src/news_feature/presentation/widget/news_feed_list.dart';
import 'package:flutter_bootcamp/src/news_feature/presentation/widget/news_feed_tabs.dart';

class NewsFeedPage extends StatefulWidget {
  const NewsFeedPage({Key? key}) : super(key: key);

  @override
  State<NewsFeedPage> createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  //! Dummy data
  ArticleRequestSuccess articleRequestSuccess = ArticleRequestSuccess(
      1,
      [
        ArticleEntity(
            author: "Antonio G. Di Benedetto",
            source: Source(id: "the-verge", name: "The Verge"),
            title:
                "Apple’s 512GB M1 Mac Mini is back down to its lowest price yet",
            description:
                "The over-performing Mac Mini with M1 processor of 2020 matches its Cyber Monday best price at Amazon. We also have great deals on the Samsung Galaxy Chromebook 2, Microsoft Modern Webcam, and the last-gen iPad Pro.",
            url:
                "https://www.theverge.com/good-deals/2022/3/3/22958558/apple-mac-mini-m1-ipad-samsung-galaxy-chromebook-2-microsoft-webcam-deal-sale",
            urlToImage:
                "https://cdn.vox-cdn.com/thumbor/xPfhXqvDfvmDopD88d2Pp11L_gs=/0x146:2040x1214/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/22045884/cwelch_201114_4292_0004.0.jpg",
            publishedAt: DateTime.parse("2022-03-03T15:05:21Z"),
            content:
                "Plus more deals on a Samsung Chromebook, Microsoft webcam, and more\r\nIf you buy something from a Verge link, Vox Media may earn a commission. See our ethics statement.\r\nPhoto by Chris Welch")
      ],
      status: "okay");

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
          tabClickCallBack: (NewsFeedTabTypes tab) {},
        ),
        NewsFeedList(
          articleRequestSuccess: articleRequestSuccess,
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
        ),
      ],
    );
  }
}
