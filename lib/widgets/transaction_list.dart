import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  List <Transaction> transaction;

  TransactionList(this.transaction);

  @override
  Widget build(BuildContext context) {
   return Column(
     children: transaction.map((tx) {
       return Padding(
         padding: const EdgeInsets.all(1.0),
         child: Card(
           elevation: 5,
           shadowColor: const Color(0xfffcf7f0),
           child: Row(
             children: <Widget>[
               Container(
                 height: 50,
                 margin: const EdgeInsets.symmetric(
                   vertical: 10,
                   horizontal: 15,
                 ),
                 padding: const EdgeInsets.all(10.0),
                 child: Text(
                   "\$ " + tx.amount.toStringAsFixed(2),
                   style: const TextStyle(
                     color: Colors.red,
                     fontSize: 17,
                     fontWeight: FontWeight.w500,
                   ),
                 ),
               ),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Text(
                     tx.title,
                     style: const TextStyle(
                       color: Colors.deepPurple,
                       fontSize: 20,
                       fontWeight: FontWeight.w700,
                     ),
                   ),
                   Text(
                     DateFormat().format(tx.date),
                     style: const TextStyle(color: Colors.blueGrey),
                   ),
                 ],
               ),
             ],
           ),
         ),
       );
     }).toList(),
   );
  }
}