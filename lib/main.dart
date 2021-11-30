import 'package:expensetracker/models/transaction.dart';
import 'package:expensetracker/widgets/new_transaction.dart';
import 'package:expensetracker/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: "New Mobile",
      amount: 357.8,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: "New Bag Pack",
      amount: 69.2,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txtitle, double txamount) {
    final newtx = Transaction(
      title: txtitle,
      amount: txamount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.insert(0, newtx);
    });
  }

  void _showModalNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addNewTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xfffbf0e3),
        appBar: AppBar(
          title: const Text("Flutter App"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                _showModalNewTransaction(context);
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        drawer: Drawer(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 250,
                padding:
                    const EdgeInsets.only(top: 15.0, left: 8.0, right: 8.0),
                child: const Card(
                  color: Color(0xfff0ffc2),
                  elevation: 5,
                  shadowColor: Colors.deepOrangeAccent,
                  child: Text("Chart !!!"),
                ),
              ),
              TransactionList(_userTransactions),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showModalNewTransaction(context);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
