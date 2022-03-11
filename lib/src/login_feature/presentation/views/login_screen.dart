import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/src/config/appConfig.dart';
import 'package:flutter_bootcamp/src/core/presentation/views/home_page.dart';
import 'package:flutter_bootcamp/src/core/presentation/widgets/custom_button.dart';
import 'package:flutter_bootcamp/src/core/presentation/widgets/text_input_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _loginScreenView(context)),
    );
  }

  _loginScreenView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 108, bottom: 72),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login",
                  style: AppConfig().themeData.textTheme.headline1,
                ),
                Text(
                  "Please sign in to continue.",
                  style: TextStyle(
                    fontSize:
                        AppConfig().themeData.textTheme.headline4!.fontSize,
                    fontWeight:
                        AppConfig().themeData.textTheme.headline4!.fontWeight,
                    color: blackLight,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              bottom: 24,
            ),
            child: TextInputBar(
              hintText: 'Email',
              iconPath: 'assets/icons/at-sign.svg',
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 24),
            child: TextInputBar(
              hintText: 'Password',
              iconPath: 'assets/icons/lock.svg',
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
                padding: const EdgeInsets.only(bottom: 42),
                child: CustomButton(
                  callback: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const HomePage()),
                      ),
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
