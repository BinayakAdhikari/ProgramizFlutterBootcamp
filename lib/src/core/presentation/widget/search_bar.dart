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
      decoration: BoxDecoration(
        border: Border.all(color: whiteLight),
        borderRadius: BorderRadius.circular(80),
      ),
      child: TextFormField(
        style: AppConfig().themeData.textTheme.headline4,
        decoration: InputDecoration(
          hintText: "Search City",
          hintStyle: AppConfig().themeData.textTheme.headline4,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 9),
          border: InputBorder.none,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              "assets/icons/search.svg",
              color: whiteLight,
              height: 4,
              width: 4,
            ),
          ),
        ),
      ),
    );
  }
}
