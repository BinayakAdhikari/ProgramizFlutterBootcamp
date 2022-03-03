import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/src/config/appConfig.dart';

class AddTodoHeader extends StatelessWidget {
  const AddTodoHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset("assets/icons/chevron-left.svg"),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            right: 12,
          ),
        ),
        Text(
          "Add Task",
          style: AppConfig().themeData.textTheme.headline1,
        ),
      ],
    );
  }
}
