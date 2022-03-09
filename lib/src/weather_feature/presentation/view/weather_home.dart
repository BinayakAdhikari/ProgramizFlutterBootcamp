import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/src/services/http_service.dart';
import 'package:flutter_bootcamp/src/weather_feature/data/datasource/weather_datasource.dart';
import 'package:flutter_bootcamp/src/weather_feature/data/repository/weather_repository.dart';
import 'package:flutter_bootcamp/src/weather_feature/domain/usecase/weather_usecase.dart';
import 'package:flutter_bootcamp/src/weather_feature/presentation/widget/weather_home_header.dart';
import 'package:flutter_bootcamp/src/weather_feature/presentation/widget/weather_home_locations_list.dart';
import 'package:flutter_bootcamp/src/weather_feature/presentation/widget/weather_home_search_block.dart';

import '../../../config/appConfig.dart';

class WeatherHome extends StatefulWidget {
  const WeatherHome({Key? key}) : super(key: key);

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  @override
  void initState() {
    GetWeatherUsecase usecase = GetWeatherUsecase(
      lat: 20,
      long: 134,
      repositroy: WeatherRepositoryImp(
        datasource: WeatherDatasourceImp(
          service: HttpService(),
        ),
      ),
    );
    usecase.execute();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: Stack(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/images/new_york.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Opacity(
                opacity: 0.7,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment(0, -0.6),
                      colors: [
                        Color(0x22000000),
                        black,
                      ],
                    ),
                  ),
                ),
              )
            ]),
          ),
          _weatherHomeView(),
        ],
      ),
    );
  }

  _weatherHomeView() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 18,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: const [
                  WeatherHomeHeader(),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 72,
                    ),
                  ),
                  WeatherHomeSearchBlock(),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                bottom: 108,
              ),
            ),
            const Expanded(
              child: WeatherHomeLocationsList(),
            ),
          ],
        ),
      ),
    );
  }
}
