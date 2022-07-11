import 'package:flutter/material.dart';
import 'package:money_transfer/screens/login.dart';
import 'package:money_transfer/styles/image_assets.dart';
import 'package:money_transfer/styles/text_styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 7,
              child: Container(
                color: Colors.white,
                child: Image.asset(transferMoneyImage),
              )),
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Container(
                  color: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: PageView(
                          controller: pageController,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text("Great way to\nmoney transfer", style: introTitle),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text("Faster with many utilities", style: introTitle),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Skip",
                              style: skipButtonTextStyle,
                            ),
                          ),
                          Expanded(
                              child: SmoothPageIndicator(controller: pageController, count: 2, effect: const ExpandingDotsEffect(radius: 0, dotWidth: 10, dotHeight: 4), onDotClicked: (index) {})),
                          IconButton(
                            onPressed: () {
                              if (pageController.page == 1) {
                                //move to login
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                              } else {
                                pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInCubic);
                              }
                            },
                            icon: Hero(
                              tag: "label",
                              child: Image.asset(
                                goForwdImage,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  child: Opacity(opacity: 0.3, child: Image.asset(backgroundDotImage)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
