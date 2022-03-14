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

  static String get url {
    switch (appFlavor) {
      case Flavor.DEV:
        return "development.com";
      case Flavor.STAGE:
        return "stage.com";
      case Flavor.PROD:
        return "production.com";
      default:
        return "google.com";
    }
  }
}
