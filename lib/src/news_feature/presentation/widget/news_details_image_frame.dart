import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/src/config/appConfig.dart';
import 'package:flutter_svg/svg.dart';

class NewsDetailsImageFrame extends StatelessWidget {
  final String imageUrl;
  final bool isReadAll;
  final Function() readAllCallback;
  const NewsDetailsImageFrame(
      {Key? key,
      required this.imageUrl,
      required this.readAllCallback,
      required this.isReadAll})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          "assets/icons/chevron-left.svg",
                          color: primary,
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/icons/heart.svg",
                      color: primary,
                    ),
                  ],
                ),
                !isReadAll
                    ? InkWell(
                        onTap: (() => readAllCallback()),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            "Read All",
                            style: AppConfig().themeData.textTheme.headline4,
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          )
        ],
      ),
    );
  }
}
