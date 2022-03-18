import 'dart:async';

import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_storekit/src/store_kit_wrappers/sk_payment_queue_wrapper.dart';
import 'package:in_app_purchase_storekit/src/store_kit_wrappers/sk_payment_transaction_wrappers.dart';
import 'package:in_app_purchase_storekit/src/store_kit_wrappers/sk_storefront_wrapper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late StreamSubscription<List<PurchaseDetails>> _subscription;
  late InAppPurchase iaPurchase;

  @override
  void initState() {
    iaPurchase = InAppPurchase.instance;

    final Stream<List<PurchaseDetails>> purchaseUpdated =
        iaPurchase.purchaseStream;
    _subscription = purchaseUpdated.listen((purchaseDetailsList) {
      _listenToPurchaseUpdated(purchaseDetailsList);
    }, onDone: () {
      print("Done");
    }, onError: (error) {
      print("Error");
      print(error.toString());
    });

    iaPurchase.restorePurchases();

    super.initState();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  Future<List<ProductDetails>> _getProducts() async {
    const Set<String> _kIds = <String>{'rc_demo_monthly', 'rc_demo_yearly'};
    final ProductDetailsResponse response =
        await iaPurchase.queryProductDetails(_kIds);
    if (response.notFoundIDs.isNotEmpty) {
      return [];
    }
    return response.productDetails;
  }

  void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        await InAppPurchase.instance.completePurchase(purchaseDetails);
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          // _handleError(purchaseDetails.error!);
        } else if (purchaseDetails.status == PurchaseStatus.purchased ||
            purchaseDetails.status == PurchaseStatus.restored) {
          // bool valid = await _verifyPurchase(purchaseDetails);
          // if (valid) {
          //   _deliverProduct(purchaseDetails);
          // } else {
          //   _handleInvalidPurchase(purchaseDetails);
          // }
          purchaseDetails.pendingCompletePurchase;
        }
        if (purchaseDetails.pendingCompletePurchase) {
          await InAppPurchase.instance
              .completePurchase(purchaseDetails)
              .onError((error, stackTrace) => print(error));
        }
      }
    });
  }

  void _purchase({required ProductDetails productDetails}) async {
    PurchaseParam purchaseParam = PurchaseParam(productDetails: productDetails);

    iaPurchase.buyNonConsumable(purchaseParam: purchaseParam);
    var transactions = await SKPaymentQueueWrapper().transactions();
    transactions.forEach((skPaymentTransactionWrapper) {
      SKPaymentQueueWrapper().finishTransaction(skPaymentTransactionWrapper);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FutureBuilder(
            future: _getProducts(),
            builder: (BuildContext context,
                AsyncSnapshot<List<ProductDetails>> snapshot) {
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ratnapark ko Netflix',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 241, 43, 40),
                      ),
                    ),
                    const SizedBox(
                      height: 52,
                    ),
                    snapshot.hasData
                        ? ListView.builder(
                            itemCount: snapshot.data!.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  _purchase(
                                      productDetails: snapshot.data![index]);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                    bottom: 12,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 24,
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      color:
                                          Color.fromARGB(255, 238, 238, 238)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(snapshot.data![index].description),
                                      Text(snapshot.data![index].price)
                                    ],
                                  ),
                                ),
                              );
                            })
                        : const CircularProgressIndicator(
                            color: Color.fromARGB(255, 241, 43, 40),
                          ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
