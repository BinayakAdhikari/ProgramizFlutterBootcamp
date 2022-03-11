import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/src/config/appConfig.dart';

import '../../../login_feature/data/model/user_model.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/home";
  final UserModel userModel;
  const HomePage({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _homePageView()),
    );
  }

  _homePageView() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Text(
        "Hello ${userModel.displayName}",
        style: AppConfig().themeData.textTheme.headline3,
      ),
    );
  }
}
