import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/src/core/presentation/views/home_page.dart';
import 'package:flutter_bootcamp/src/login_feature/data/model/user_model.dart';
import 'package:flutter_bootcamp/src/login_feature/presentation/views/login_screen.dart';

class RouteGenerator {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return LoginScreen();
          },
        );

      case HomePage.routeName:
        UserModel usermodel = settings.arguments as UserModel;
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return HomePage(userModel: usermodel);
          },
        );
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return LoginScreen();
          },
        );
    }
  }
}
