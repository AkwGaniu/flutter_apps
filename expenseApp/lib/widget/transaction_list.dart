import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;
  Function deleteTransaction;
  TransactionList(this._userTransactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: _userTransactions.isEmpty
          ? Container(
              height: 200,
              child: Column(
                children: [
                  Text(
                    'No transactions yet',
                    // ignore: deprecated_member_use
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 0),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FittedBox(
                            child: Text(
                              '\$${_userTransactions[index].amount.toStringAsFixed(2)}',
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        _userTransactions[index].title,
                        // ignore: deprecated_member_use
                        style: Theme.of(context).textTheme.title,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMEd()
                            .format(_userTransactions[index].date),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black38,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () => deleteTransaction(_userTransactions[index].id),
                      ),
                    ),
                  ),
                  // Row(
                  //     children: [
                  //       Container(
                  //         child: Text(
                  //           '\$${_userTransactions[index].amount.toStringAsFixed(2)}',
                  //           style: TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 15,
                  //               color: Colors.purple),
                  //         ),
                  //         padding: EdgeInsets.symmetric(
                  //           horizontal: 10,
                  //           vertical: 15,
                  //         ),
                  //         margin: EdgeInsets.all(10),
                  //         decoration: BoxDecoration(
                  //           border: Border.all(
                  //             width: 2,
                  //             style: BorderStyle.solid,
                  //             color: Colors.purple,
                  //           ),
                  //         ),
                  //       ),
                  //       Column(
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(_userTransactions[index].title,
                  //               // ignore: deprecated_member_use
                  //               style: Theme.of(context).textTheme.title),
                  //           Text(
                  //             DateFormat.yMMMEd()
                  //                 .format(_userTransactions[index].date),
                  //             style: TextStyle(
                  //                 fontWeight: FontWeight.bold,
                  //                 fontSize: 14,
                  //                 color: Colors.black38),
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                );
              },
              itemCount: _userTransactions.length,
            ),
    );
  }
}
