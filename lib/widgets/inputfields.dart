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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              border:
                                  Border.all(color: Colors.purple, width: 1)),
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 15.0),
                          child: Text(
                            'BAM ${transactions[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColorLight,
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${transactions[index].title}',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                DateFormat.yMMMd()
                                    .format(transactions[index].date),
                                style: TextStyle(
                                    color: Colors.grey[650], fontSize: 16),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ));
  }
}
