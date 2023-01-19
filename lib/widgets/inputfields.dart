import 'package:flutter/material.dart';
import 'package:zoey_expenses_planner/models/transaction.dart';
import 'package:intl/intl.dart';

class InputFields extends StatelessWidget {
  final List<Transaction> transactions;
  InputFields(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: transactions.isEmpty
            ? Column(
                children: [
                  Text("This page is empty"),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/zzz.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              )
            : ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                        leading: FittedBox(
                          child: CircleAvatar(
                            radius: 30,
                            child: Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Text(
                                '\$${transactions[index].amount.toStringAsFixed(0)}',
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          '${transactions[index].title}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        subtitle: Text(
                          DateFormat.yMMMd().format(transactions[index].date),
                          style:
                              TextStyle(color: Colors.grey[650], fontSize: 16),
                        )),
                  );
                },
              ));
  }
}
