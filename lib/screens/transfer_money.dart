import 'dart:async';

import 'package:flutter/material.dart';
import 'package:money_transfer/styles/image_assets.dart';
import 'package:money_transfer/styles/text_styles.dart';
import 'package:money_transfer/utils/app_utils.dart';

class TransferMoney extends StatefulWidget {
  const TransferMoney({Key? key}) : super(key: key);

  @override
  State<TransferMoney> createState() => _TransferMoneyState();
}

class _TransferMoneyState extends State<TransferMoney> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text("Transfer money", style: title1Style),
      ),
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 56,
                    backgroundImage: AssetImage(dpImage),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)), primary: Colors.blue.withOpacity(0.4), elevation: 0),
                    onPressed: () {},
                    child: Text("👋 Say Hi", style: title4Style),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(16)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 30, left: 16.0, right: 16.0),
                      color: Colors.white.withOpacity(0.1),
                      child: TextField(
                        controller: controller,
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 56.0, color: Colors.white, fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(border: InputBorder.none, hintText: "₹ 0.00"),
                      ),
                    ),
                    const SizedBox(height: 27.0),
                    ListTile(
                      title: Text("Transfer to", style: title2Style),
                      subtitle: Text("Muhammed Rafeeq", style: titleStyle(Colors.white)),
                      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                    ),
                    const SizedBox(height: 27.0),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          minimumSize: const Size.fromHeight(50), // NEW
                        ),
                        onPressed: () {
                          if (controller.text.isNotEmpty) {
                            Timer(const Duration(seconds: 3), () {
                              Navigator.pop(context);
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
                          } else {
                            showMessage(context: context, message: "Enter valid amount", color: Colors.red);
                          }
                        },
                        child: Text(
                          "Send",
                          style: titleStyle(Colors.black),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
