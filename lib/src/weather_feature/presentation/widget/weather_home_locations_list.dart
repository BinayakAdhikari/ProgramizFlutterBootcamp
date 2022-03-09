import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/src/weather_feature/presentation/view/weather_city_detail_page.dart';

import '../../../config/appConfig.dart';

class WeatherHomeLocationsList extends StatelessWidget {
  const WeatherHomeLocationsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> gg = ["g", 'g', 'g'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 24,
          ),
          child: Text(
            "Locations",
            style: AppConfig().themeData.textTheme.headline2,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            bottom: 24,
          ),
        ),
        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: gg.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      WeatherCityDetailPage.routeName,
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2 - 24,
                    margin: EdgeInsets.only(
                      right: 24,
                      left: index == 0 ? 24 : 0,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 24,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: primary,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Chicago",
                              style: AppConfig().themeData.textTheme.headline5,
                            ),
                            Text(
                              "10:44 am",
                              style: AppConfig().themeData.textTheme.headline5,
                            ),
                          ],
                        ),
                        Text(
                          "15°",
                          style: AppConfig().themeData.textTheme.headline1,
                        ),
                        Text(
                          "Cloudy",
                          style: AppConfig().themeData.textTheme.headline5,
                        ),
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
