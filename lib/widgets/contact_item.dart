import 'package:flutter/material.dart';
import 'package:money_transfer/screens/transfer_money.dart';
import 'package:money_transfer/styles/text_styles.dart';

class ContactItem extends StatelessWidget {
  final String name;
  const ContactItem({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 55.0,
        width: 55.0,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          color: Colors.black12,
          child: Center(child: Text(name.substring(0, 1).toUpperCase(), style: title1Style)),
        ),
      ),
      title: Text(name, style: title4Style),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const TransferMoney()));
      },
    );
  }
}
