import 'package:flutter/material.dart';
import 'package:native_admob_example/native_ad_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.separated(
          separatorBuilder: (_, __) => const SizedBox(
            height: 20,
          ),
          // Adjust itemCount based on the ad load state
          itemCount: 20,
          itemBuilder: (context, index) {
            // Render a banner ad
            if (index == 3 || index == 8 || index == 14) {
              return NativeAdView();
            } else {
              // Get adjusted item index from _getDestinationItemIndex()
              return Container(
                color: Colors.amber,
                height: 100,
                child: Center(child: Text('List item #$index')),
              );
            }
          },
        ),
      ),
    );
  }
}
