import 'package:flutter/material.dart';

import './widget/user_transaction.dart';
import './widget/transaction_list.dart';
import './models/transaction.dart';
import './widget/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      theme: ThemeData(
        accentColor: Colors.amber,
        primarySwatch: Colors.purple,
        fontFamily: 'QuickSand',
        errorColor: Colors.redAccent,
        textTheme: ThemeData.light().textTheme.copyWith(
              // ignore: deprecated_member_use
              title: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
              button: TextStyle(color: Colors.white)
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            // ignore: deprecated_member_use
            title: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
      home: Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [];

  List<Transaction> get _recentTxn {
    return _transactions.where((txn) {
      return txn.date.isAfter(
        DateTime.now().subtract(
          Duration(
            days: 7,
          ),
        ),
      );
    }).toList();
  }

  void _startAddNewTransaction(BuildContext context) {
    print(context);
    showBottomSheet(
      context: context,
      builder: (context) {
        return AddTransaction(_addTransaction);
        // GestureDetector(
        //   onTap: () {},
        //   child: AddTransaction(_addTransaction),
        //   behavior: HitTestBehavior.opaque,
        // );
      },
    );
  }

  void _addTransaction(String txTitle, double txAmount, DateTime selectedDate) {
    final newTrx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: selectedDate
    );
    setState(() => _transactions.add(newTrx));
    Navigator.of(context).pop();
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((trx) => trx.id == id);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expense Tracker'),
          actions: [
            IconButton(
              iconSize: 40.0,
              color: Colors.white,
              icon: Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              width: double.infinity,
              child: Chart(_recentTxn),
            ),
            TransactionList(_transactions, _deleteTransaction),
          ]),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        ));
  }
}
