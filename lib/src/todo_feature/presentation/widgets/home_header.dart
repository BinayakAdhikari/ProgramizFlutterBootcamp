import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/src/config/appConfig.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset("assets/icons/menu.svg"),
        Text(
          "My Todo",
          style: AppConfig().themeData.textTheme.headline1,
        ),
        SvgPicture.asset("assets/icons/bell.svg"),
      ],
    );
  }
}
