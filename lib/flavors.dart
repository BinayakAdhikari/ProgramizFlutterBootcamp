import 'dart:ui';

import 'package:flutter/material.dart';

enum Flavor {
  DEV,
  STAGE,
  PROD,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.DEV:
        return 'Development';
      case Flavor.STAGE:
        return 'Staging';
      case Flavor.PROD:
        return 'Production';
      default:
        return 'title';
    }
  }

  static Color get color {
    switch (appFlavor) {
      case Flavor.DEV:
        return const Color.fromARGB(221, 247, 65, 65);
      case Flavor.STAGE:
        return const Color.fromARGB(240, 44, 216, 247);
      case Flavor.PROD:
        return const Color.fromARGB(221, 78, 247, 26);
      default:
        return const Color.fromARGB(221, 26, 26, 26);
    }
  }
}
