import 'dart:async';

import 'package:flutter/material.dart';
import 'package:money_transfer/screens/home.dart';
import 'package:money_transfer/styles/image_assets.dart';
import 'package:money_transfer/styles/text_styles.dart';
import 'package:money_transfer/widgets/login_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Opacity(
                opacity: 0.3,
                child: Image.asset(
                  backgroundDotImage,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Hero(tag: "label", child: Text("Hello.\nWelcome Back", style: loginTitleStyle)),
                  ),
                  Form(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const InputField(hint: "USERNAME"),
                          const SizedBox(height: 27.0),
                          const InputField(
                            hint: "PASSWORD",
                            secureField: true,
                            inputType: TextInputType.text,
                          ),
                          const SizedBox(height: 16.0),
                          TextButton(onPressed: () {}, child: Text("Forgot Password ?", style: forgotTitleStyle))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        minimumSize: const Size.fromHeight(50), // NEW
                      ),
                      onPressed: () {
                        Timer(const Duration(seconds: 3), () {
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (builder) => const Home()));
                        });
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Stack(
                              children: [
                                Image.asset(
                                  backgroundDotImage,
                                  height: MediaQuery.of(context).size.height,
                                  fit: BoxFit.cover,
                                ),
                                const Center(
                                  child: CircularProgressIndicator(color: Colors.white),
                                )
                              ],
                            );
                          },
                        );
                      },
                      child: Text("LOGIN", style: buttonTitleStyle),
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
