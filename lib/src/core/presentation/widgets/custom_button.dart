import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/src/config/appConfig.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
  final Function() callback;
  const CustomButton({Key? key, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        callback();
      },
      child: Container(
        width: 120,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: const LinearGradient(
            colors: [primary, primaryLight],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: TextStyle(
                fontSize: AppConfig().themeData.textTheme.headline4!.fontSize,
                fontWeight:
                    AppConfig().themeData.textTheme.headline4!.fontWeight,
                color: pureWhite,
              ),
            ),
            SvgPicture.asset(
              "assets/icons/arrow-right.svg",
              color: pureWhite,
            )
          ],
        ),
      ),
    );
  }
}
