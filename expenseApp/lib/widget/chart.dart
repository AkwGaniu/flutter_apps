import "package:flutter/material.dart";
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalCost = 0.0;

      for (int i = 0; i < recentTransactions.length; i++) {
        if (weekDay.day == recentTransactions[i].date.day &&
            weekDay.month == recentTransactions[i].date.month &&
            weekDay.year == recentTransactions[i].date.year) {
              print(recentTransactions[i].amount);
          totalCost += recentTransactions[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalCost,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransaction.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransaction.map(
            (data) {
              return Flexible(
                fit: FlexFit.tight,              
                child: ChartBar(
                  data['day'],
                  data['amount'],
                  totalSpending == 0.0 ? 0.0 : (data['amount'] as double) / totalSpending,
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
