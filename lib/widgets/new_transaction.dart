import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _amountControler = TextEditingController();
  final _titleControler = TextEditingController();
  DateTime? _selectedDate;

  void submitData() {
    final enteredTitle = _titleControler.text;
    final enteredAmount = double.parse(_amountControler.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(enteredTitle, enteredAmount);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleControler,
              keyboardType: TextInputType.text,
              onSubmitted: (_) => submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? "No date choosen"
                          : 'Picked date: ${DateFormat.yMMMd().format(_selectedDate!)}',
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor),
                      onPressed: _presentDatePicker,
                      child: Text(
                          style: TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.white),
                          "Choose date"))
                ],
              ),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountControler,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            SizedBox(height: 10.0),
            OutlinedButton(
              onPressed: submitData,
              child: Text(
                "Add transaction",
                style: TextStyle(color: Colors.purple),
              ),
            )
          ],
        ),
      ),
    );
  }
}
