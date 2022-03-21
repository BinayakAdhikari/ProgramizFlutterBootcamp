import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/src/views/banner_add.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  initState() {
    _initGoogleMobileAds();
    super.initState();
  }

  Future<InitializationStatus> _initGoogleMobileAds() {
    return MobileAds.instance.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BannerAdd()));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 157, 189, 245),
                            borderRadius: BorderRadius.circular(15)),
                        child: const Center(child: Text("Banner Ad")),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 238, 105, 105),
                          borderRadius: BorderRadius.circular(15)),
                      child: const Center(child: Text("Reward Ad")),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
