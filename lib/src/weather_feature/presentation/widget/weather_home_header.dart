import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/src/config/appConfig.dart';
import 'package:flutter_svg/svg.dart';

class WeatherHomeHeader extends StatelessWidget {
  const WeatherHomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          "assets/icons/menu.svg",
          color: white,
        ),
        const CircleAvatar(
          backgroundColor: whiteLight,
          backgroundImage: AssetImage("assets/images/profile.jpeg"),
        )
      ],
    );
  }
}
