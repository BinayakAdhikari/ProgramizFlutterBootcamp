import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/src/config/appConfig.dart';
import 'package:flutter_svg/svg.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
      decoration: BoxDecoration(
        color: greyLighter,
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset("assets/icons/search.svg"),
          const Padding(
            padding: EdgeInsets.only(
              right: 12,
            ),
          ),
          Text(
            "Search",
            style: AppConfig().themeData.textTheme.headline5,
          )
        ],
      ),
    );
  }
}
