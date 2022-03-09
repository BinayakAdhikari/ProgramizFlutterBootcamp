import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/src/config/appConfig.dart';
import 'package:flutter_bootcamp/src/core/presentation/widget/search_bar.dart';

class WeatherHomeSearchBlock extends StatelessWidget {
  const WeatherHomeSearchBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello Mandip",
          style: AppConfig().themeData.textTheme.headline1,
        ),
        Text(
          "Check the weather by the city",
          style: AppConfig().themeData.textTheme.headline3,
        ),
        const Padding(
          padding: EdgeInsets.only(
            bottom: 24,
          ),
        ),
        SearchBar(),
      ],
    );
  }
}
