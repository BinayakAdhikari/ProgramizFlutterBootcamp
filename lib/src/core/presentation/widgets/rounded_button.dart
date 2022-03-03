import 'package:flutter/material.dart';
import 'package:todo_app/src/config/appConfig.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final Function() callback;
  const RoundedButton({Key? key, required this.title, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        callback();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(
          vertical: 12,
        ),
        decoration: const BoxDecoration(
          color: primaryDarker,
          borderRadius: BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: AppConfig().themeData.textTheme.headline4!.fontSize,
              fontWeight: AppConfig().themeData.textTheme.headline4!.fontWeight,
              color: white,
            ),
          ),
        ),
      ),
    );
  }
}
