import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> transaction;
  final Function deletetx;

  TransactionList(this.transaction, this.deletetx);

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "No Transactions Yet",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.red),
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset('assets/images/waiting.png'),
            ],
          )
        : ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (ctx, index) {
              return Padding(
                padding: const EdgeInsets.only(
                    top: 1.0, bottom: 1.0, left: 12.0, right: 12.0),
                child: Card(
                  elevation: 5,
                  shadowColor: const Color(0xfffcf7f0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 75,
                        width: 75,
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.purple,
                          child: FittedBox(
                            child: Text(
                              '\$${transaction[index].amount.toStringAsFixed(0)}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            transaction[index].title,
                            style: const TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            DateFormat.yMMMd().format(transaction[index].date),
                            style: const TextStyle(color: Colors.blueGrey),
                          ),
                        ],
                      ),
                      IconButton(
                        color: Colors.red,
                        onPressed: () => deletetx(transaction[index].id),
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: transaction.length,
          );
  }
}
