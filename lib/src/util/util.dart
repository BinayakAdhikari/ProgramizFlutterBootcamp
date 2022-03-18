import 'package:in_app_purchase/in_app_purchase.dart';

Future<void> loadPurchases() async {
  final available = await InAppPurchase.instance.isAvailable();
  if (!available) {
    return;
  }
}
