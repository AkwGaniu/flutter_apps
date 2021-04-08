import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransaction extends StatefulWidget {
  final Function addNewTransaction;
  AddTransaction(this.addNewTransaction);

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime _selectedDate;
  _submitData() {
    var amount = amountController.text;
    var title = titleController.text;
    if (title.isEmpty || amount.isEmpty || _selectedDate == null) {
      return;
    }
    widget.addNewTransaction(title, double.parse(amount), _selectedDate);
  }
  void _chooseDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
                onSubmitted: (_) => _submitData(),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDate == null ? 'No date chosen!' : 'Selected Date: ${DateFormat.yMd().format(_selectedDate)}',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    FlatButton(
                      child: Text(
                        'Choose Date',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      textColor: Theme.of(context).primaryColor,
                      onPressed: _chooseDate,
                    ),
                  ],
                ),
              ),
              RaisedButton(
                textColor: Theme.of(context).textTheme.button.color,
                color: Theme.of(context).primaryColor,
                child: Text(
                  'Add Transaction',
                  style: TextStyle(fontSize: 14),
                ),
                onPressed: _submitData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
