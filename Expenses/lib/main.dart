import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import './widgets/chart.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';

void main() {
  // // As per the latest version of the flutter
  // // Before the setting orientation we need to initialise binding(before runApp) by calling like this
  // WidgetsFlutterBinding.ensureInitialized();

  // // Setting Orientation
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses Manager',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.purple,
        fontFamily: 'Quicksand',
        // Take all the default features of the textTheme and override some of them.
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: ThemeData.light().textTheme.headline6.copyWith(
                    fontFamily: 'OpenSans',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
              button:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: ThemeData.dark().textTheme.headline6.copyWith(
                      fontFamily: 'Pacifico',
                      fontSize: 25,
                    ),
              ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _user_transactions = [
    // Transaction(
    //     id: 't1', title: 'God photo', amount: 100.9, date: DateTime.now()),
    // Transaction(
    //     id: 't2',
    //     title: 'Weekly Groceries',
    //     amount: 430.5,
    //     date: DateTime.now()),
    // Transaction(
    //     id: 't3', title: 'Sanitizer 50ml', amount: 29.12, date: DateTime.now()),
  ];

  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _user_transactions
        .where(
            (tx) => tx.date.isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  void _addNewTransaction(
      String title, double amount, DateTime date, TimeOfDay time) {
    final newTx = Transaction(
      title: title,
      amount: amount,
      date: DateTime(date.year, date.month, date.day, time.hour, time.minute),
      id: DateTime(date.year, date.month, date.day, time.hour, time.minute)
          .toString(),
    );
    setState(() {
      _user_transactions.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _user_transactions.removeWhere((tx) => tx.id == id);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      isScrollControlled: true,
      builder: (bctx) {
        return GestureDetector(
          onTap: () {}, //No Action
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext buildContext) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text('Expenses Manager'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                    child: Icon(CupertinoIcons.add),
                    onTap: () {
                      _startAddNewTransaction(buildContext);
                    })
              ],
            ),
          )
        : AppBar(
            title: Text('Expenses Manager'),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    _startAddNewTransaction(buildContext);
                  })
            ],
          );

    final txListWidget = Container(
      height: ((mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top) *
          0.7),
      child: TransactionList(_user_transactions, _deleteTransaction),
    ); //Transactions Widget

    final pageBody = SafeArea(
        child: SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('ShowChart', style: Theme.of(context).textTheme.caption),
                  Switch.adaptive(
                    value: _showChart,
                    onChanged: (newVal) {
                      setState(() {
                        _showChart = newVal;
                      });
                    },
                  )
                ],
              ),

            if (!isLandscape)
              Container(
                height: ((mediaQuery.size.height -
                        appBar.preferredSize.height -
                        mediaQuery.padding.top) *
                    0.3),
                width: double.infinity,
                child: Card(
                  color: Colors.blue,
                  child: Chart(_recentTransactions),
                  elevation: 10,
                ),
              ),
            if (!isLandscape) txListWidget,
            //By default it takes the size of the child
            if (isLandscape)
              _showChart
                  ? Container(
                      height: ((mediaQuery.size.height -
                              appBar.preferredSize.height -
                              mediaQuery.padding.top) *
                          0.7),
                      width: double.infinity,
                      child: Card(
                        color: Colors.blue,
                        child: Chart(_recentTransactions),
                        elevation: 10,
                      ),
                    )
                  : txListWidget
          ]),
    ));

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody,
            navigationBar: appBar,
          )
        : Scaffold(
            appBar: appBar,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () => _startAddNewTransaction(buildContext),
                  ),
            body: pageBody);
  }
}
