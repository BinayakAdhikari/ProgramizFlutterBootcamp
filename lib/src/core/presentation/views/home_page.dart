import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/src/config/appConfig.dart';
import 'package:flutter_bootcamp/src/services/authentication_serivce.dart';

import '../../../di/injection_base.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(InjectionModule().get<AuthenticationService>().hashCode);
    return Scaffold(
      body: SafeArea(child: _homePageView()),
    );
  }

  _homePageView() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Text(
        "Hello Mandip",
        style: AppConfig().themeData.textTheme.headline3,
      ),
    );
  }
}
