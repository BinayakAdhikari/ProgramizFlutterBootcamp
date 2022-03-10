import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewsFeedHeader extends StatelessWidget {
  const NewsFeedHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          "assets/icons/chevron-left.svg",
        ),
        const CircleAvatar(
          backgroundImage: AssetImage("assets/images/profile.jpeg"),
        )
      ],
    );
  }
}
