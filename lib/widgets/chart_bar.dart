import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double amountPct;

  ChartBar(this.label, this.spendingAmount, this.amountPct);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '\$${spendingAmount.toStringAsFixed(0)}',
          style: const TextStyle(fontSize: 15),
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          height: 100,
          width: 20,
          margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey, width: 2.0),
                  color: const Color(0xfffad3bb),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              FractionallySizedBox(
                heightFactor: amountPct,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label)
      ],
    );
  }
}
