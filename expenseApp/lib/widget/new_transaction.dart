import 'package:flutter/material.dart';

// import '../widget/transaction_list.dart';
import '../widget/user_transaction.dart';
import '../models/transaction.dart';

class NewTransaction extends StatefulWidget {
  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 'tr1',
      title: 'New wears',
      amount: 10.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'tr2',
      title: 'New foot wears',
      amount: 18.99,
      date: DateTime.now(),
    ),
  ];

  void _addTransaction(String txTitle, double txAmount) {
    final newTrx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now()
    );
    setState(() => _transactions.add(newTrx) );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddTransaction(_addTransaction),
      ],
    );
  }
}
