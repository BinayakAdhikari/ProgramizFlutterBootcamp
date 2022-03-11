import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/src/config/appConfig.dart';
import 'package:flutter_bootcamp/src/core/presentation/views/home_page.dart';
import 'package:flutter_bootcamp/src/core/presentation/widgets/custom_button.dart';
import 'package:flutter_bootcamp/src/core/presentation/widgets/text_input_bar.dart';
import 'package:flutter_bootcamp/src/di/injection_base.dart';
import 'package:flutter_bootcamp/src/login_feature/data/datasource/login_datasource.dart';
import 'package:flutter_bootcamp/src/login_feature/data/repository/login_repository.dart';
import 'package:flutter_bootcamp/src/login_feature/presentation/blocs/auth_bloc.dart';
import 'package:flutter_bootcamp/src/login_feature/usecases/login_usecase.dart';
import 'package:flutter_bootcamp/src/services/authentication_serivce.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginUsecase loginUsecase;
  late AuthBloc bloc;

  @override
  void initState() {
    bloc = InjectionModule().get<AuthBloc>();

    loginUsecase = LoginUsecase(
      repository: LoginRepoistoryImp(
        loginDatasource: LoginDatasourceImp(
            authenticationService:
                InjectionModule().get<AuthenticationService>()),
      ),
    );

    bloc.authenticationStream.listen((event) {
      if (event != null) {
        Navigator.pushNamed(context, HomePage.routeName, arguments: event);
      }
    });

    super.initState();
  }

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
                    bloc.login(
                        email: "raister21@gmail.com", password: "waduhek");
                  },
                )),
          ),
        ],
      ),
    );
  }
}
