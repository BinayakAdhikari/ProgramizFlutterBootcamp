import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'flavors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseRemoteConfig firebaseRemoteConfig = FirebaseRemoteConfig.instance;

  firebaseRemoteConfig.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 2),
      minimumFetchInterval: const Duration(minutes: 2),
    ),
  );
  F.appFlavor = Flavor.STAGE;
  runApp(App());
}
