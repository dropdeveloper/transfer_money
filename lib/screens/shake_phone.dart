import 'package:flutter/material.dart';
import 'package:money_transfer/styles/image_assets.dart';
import 'package:money_transfer/styles/text_styles.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

class ShakePhone extends StatefulWidget {
  const ShakePhone({Key? key}) : super(key: key);

  @override
  State<ShakePhone> createState() => _ShakePhoneState();
}

class _ShakePhoneState extends State<ShakePhone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text("Receive money", style: title1Style),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RippleAnimation(
              repeat: false,
              color: Colors.black.withOpacity(0.1),
              minRadius: 100,
              ripplesCount: 6,
              child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), border: Border.all(width: 1, color: Colors.black)),
                child: Image.asset(shake1Image, width: 56),
              ),
            ),
            Text("Shake to pay", style: title1Style),
            const SizedBox(height: 16.0),
            Text("Tell the other participates to\nshake the phone too", style: title2Style, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
