import 'package:flutter/material.dart';
import 'package:money_transfer/model/trans_model.dart';
import 'package:money_transfer/styles/text_styles.dart';

class TransItem extends StatelessWidget {
  final TransactionModel model;
  const TransItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Card(
        elevation: 4,
        color: Colors.black.withOpacity(0.9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: const SizedBox(
          width: 50,
          height: 50,
          child: Padding(
            padding: EdgeInsets.all(1.0),
            child: Icon(Icons.money, color: Colors.white),
          ),
        ),
      ),
      title: Text(model.ref!, style: title1Style),
      subtitle: Text(model.desc!, style: title2Style, maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: Text(model.type == 0 ? "+ ${model.amount}" : "- ${model.amount}", style: titleStyle(model.type == 0 ? Colors.green : Colors.redAccent)),
    );
  }
}
