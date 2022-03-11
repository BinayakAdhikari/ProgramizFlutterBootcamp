import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/src/config/appConfig.dart';
import 'package:flutter_svg/svg.dart';

class TextInputBar extends StatelessWidget {
  final String hintText;
  final String? iconPath;
  const TextInputBar({Key? key, required this.hintText, this.iconPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: pureWhite,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 4),
              blurRadius: 24,
            )
          ]),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          prefixIcon: iconPath != null
              ? Container(
                  padding: EdgeInsets.all(12),
                  child: SvgPicture.asset(
                    iconPath!,
                    width: 6,
                    height: 6,
                  ),
                )
              : const SizedBox(
                  width: 6,
                  height: 6,
                ),
        ),
      ),
    );
  }
}
