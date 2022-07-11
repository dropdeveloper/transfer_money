import 'package:flutter/material.dart';
import 'package:money_transfer/styles/text_styles.dart';

class CardView extends StatelessWidget {
  final Color color;
  final String cardNumber;
  final String cardHolder;
  final String cardExpiration;

  const CardView({Key? key, required this.color, required this.cardNumber, required this.cardHolder, required this.cardExpiration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        height: 200,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 22.0),
        child: Column(
          /*2*/
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildLogosBlock(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Balance Amount", style: hintTitleStyle),
                Text("₹ 45,000.34", style: fieldTitleStyle),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Text(
                cardNumber,
                style: hintTitleStyle,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildDetailsBlock(
                  label: 'CARDHOLDER',
                  value: cardHolder,
                ),
                _buildDetailsBlock(
                  label: 'VALID THRU',
                  value: cardExpiration,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column _buildDetailsBlock({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Row _buildLogosBlock() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Image.asset(
          "assets/images/contact_less.png",
          height: 20,
          width: 18,
        ),
        Image.asset(
          "assets/images/mastercard.png",
          height: 50,
          width: 50,
        ),
      ],
    );
  }
}
