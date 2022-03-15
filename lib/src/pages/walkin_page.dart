import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/src/config/app_config.dart';

import '../../flavors.dart';

class WalkinPage extends StatefulWidget {
  const WalkinPage({Key? key}) : super(key: key);

  @override
  State<WalkinPage> createState() => _WalkinPageState();
}

class _WalkinPageState extends State<WalkinPage> {
  late RemoteConfigValue configMessage;

  @override
  void initState() {
    super.initState();
    configMessage = FirebaseRemoteConfig.instance.getValue('WALKIN_VALUES');

    getFirebaseConfig();
  }

  Future<void> getFirebaseConfig() async {
    bool updated = await FirebaseRemoteConfig.instance.fetchAndActivate();
    if (updated) {
      setState(() {
        configMessage = FirebaseRemoteConfig.instance.getValue('WALKIN_VALUES');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: F.color,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Text(
                F.title,
                style: AppConfig().themeData.textTheme.headline1,
              ),
              const SizedBox(
                height: 72,
              ),
              Text(
                json.decode(configMessage.asString())['welcome_message'],
                style: AppConfig().themeData.textTheme.headline2,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(json.decode(configMessage.asString())['body_message'],
                  style: AppConfig().themeData.textTheme.headline3),
            ],
          ),
        ),
      ),
    );
  }
}
