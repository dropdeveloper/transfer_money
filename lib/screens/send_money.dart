import 'package:flutter/material.dart';
import 'package:money_transfer/styles/text_styles.dart';
import 'package:money_transfer/widgets/contact_item.dart';
import 'package:money_transfer/widgets/search_field.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({Key? key}) : super(key: key);

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  List<String> contacts = [];

  @override
  void initState() {
    contacts.add("Ijas Aslam");
    contacts.add("Aslam");
    contacts.add("Muhammed Rafi");
    contacts.add("Jabir");
    contacts.add("Nafisa");
    contacts.add("Falah");
    contacts.sort((a, b) {
      return a.compareTo(b);
    });
    super.initState();
  }

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
      body: Column(
        children: [
          const SearchFieldInput(),
          const SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ContactItem(
                  name: contacts[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
