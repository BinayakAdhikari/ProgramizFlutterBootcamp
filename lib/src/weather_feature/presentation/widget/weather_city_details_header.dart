import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/src/config/appConfig.dart';
import 'package:flutter_svg/svg.dart';

class WeatherCityDetailsHeader extends StatelessWidget {
  const WeatherCityDetailsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.all(
              8,
            ),
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: SvgPicture.asset(
              "assets/icons/chevron-left.svg",
              color: pureWhite,
            ),
          ),
        ),
        const CircleAvatar(
          backgroundColor: whiteLight,
          backgroundImage: AssetImage("assets/images/profile.jpeg"),
        )
      ],
    );
  }
}
