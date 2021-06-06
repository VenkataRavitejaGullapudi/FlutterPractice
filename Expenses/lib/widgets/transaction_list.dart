import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deletetx;
  TransactionList(this.transactions, this.deletetx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No transactions added yet',
                  style: Theme.of(context).textTheme.headline6,
                ),
                // Can be used as container and also as the seperator as it also accepts if we not added child
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/notrans.jpeg',
                    // fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (context, itemIndex) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 40,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: FittedBox(
                        child: Text(
                          '₹ ${transactions[itemIndex].amount.toString()}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    transactions[itemIndex].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat('MMM d, y. h:mm a')
                        .format(transactions[itemIndex].date),
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: MediaQuery.of(context).size.width > 360
                      ? TextButton.icon(
                          onPressed: () => deletetx(transactions[itemIndex].id),
                          icon: Icon(Icons.delete),
                          label: Text("Delete"),
                          style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.red)))
                      : IconButton(
                          icon: Icon(Icons.delete),
                          color: Colors.red,
                          onPressed: () => deletetx(transactions[itemIndex].id),
                        ),
                ),

                // child: Row(
                //   children: <Widget>[
                //     Container(
                //       child: Text(
                //         '₹ ${transactions[itemIndex].amount.toStringAsFixed(2)}',
                //         style: TextStyle(
                //           fontWeight: FontWeight.bold,
                //           fontSize: 20,
                //           color: Theme.of(context).primaryColor,
                //         ),
                //       ),
                //       margin: EdgeInsets.symmetric(
                //         vertical: 10,
                //         horizontal: 15,
                //       ),
                //       decoration: BoxDecoration(
                //           border: Border.all(
                //         color: Theme.of(context).primaryColor,
                //         width: 2,
                //       )),
                //       padding: EdgeInsets.all(10),
                //     ),
                //     Flexible(
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: <Widget>[
                //           Text(
                //             transactions[itemIndex].title,
                //             style: Theme.of(context).textTheme.headline6,
                //           ),
                //           Text(
                //               DateFormat('MMMM d, y. h:mm a')
                //                   .format(transactions[itemIndex].date),
                //               style: TextStyle(color: Colors.grey)),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
