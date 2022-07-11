import 'package:flutter/material.dart';
import 'package:money_transfer/styles/image_assets.dart';
import 'package:money_transfer/styles/text_styles.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

class ReceiveMoney extends StatefulWidget {
  const ReceiveMoney({Key? key}) : super(key: key);

  @override
  State<ReceiveMoney> createState() => _ReceiveMoneyState();
}

class _ReceiveMoneyState extends State<ReceiveMoney> {
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
              repeat: true,
              color: Colors.black.withOpacity(0.5),
              minRadius: 100,
              ripplesCount: 6,
              child: const CircleAvatar(
                radius: 56,
                backgroundImage: AssetImage(dpImage),
              ),
            ),
            const SizedBox(height: 27.0),
            Text("Receive Money", style: title3Style),
            Text("waiting for receiving...", style: title2Style),
          ],
        ),
      ),
    );
  }
}
