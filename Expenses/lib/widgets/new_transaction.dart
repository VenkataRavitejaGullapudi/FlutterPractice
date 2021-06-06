import 'dart:io';

import 'package:Expenses/widgets/adaptive_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function saveTransaction;

  NewTransaction(this.saveTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;
  TimeOfDay _selectedTime;

  void _submitAction() {
    if (_amountController.text.isEmpty) return;
    final enteredAmount = double.parse(_amountController.text);
    final enteredTitle = _titleController.text;

    if (enteredTitle.isEmpty ||
        enteredAmount <= 0 ||
        _selectedDate == null ||
        _selectedTime == null) return;

    // We can access the widget properties using widget object.
    widget.saveTransaction(
      enteredTitle,
      enteredAmount,
      _selectedDate,
      _selectedTime,
    );
    print(_titleController.text + "\n" + _amountController.text);
    // context gives the access to context related to the widget
    // closes the top most scren that is displayed.. Used to close the modal after submitting.
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;

      setState(() {
        _selectedDate = pickedDate;
      });
      showTimePicker(
        context: context,
        initialTime: TimeOfDay(
          hour: DateTime.now().hour,
          minute: DateTime.now().minute,
        ),
      ).then((pickedTime) {
        if (pickedTime == null) return;
        setState(() {
          _selectedTime = pickedTime;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          top: 30,
          left: 15,
          right: 15,
          // The parts of the display that are completely obscured by system UI, typically by the device's keyboard.
          // When a mobile device's keyboard is visible viewInsets.bottom corresponds to the top of the keyboard.
          bottom: MediaQuery.of(context).viewInsets.bottom + 25,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              autocorrect: true,
              decoration: InputDecoration(labelText: 'Expense Title'),
              controller: _titleController,
            ),
            TextField(
              autocorrect: true,
              decoration: InputDecoration(labelText: 'Amount spent'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitAction,
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(_selectedDate == null || _selectedTime == null
                        ? 'No  Date or Time Chosen'
                        : 'Picked Date & Time:\n${DateFormat.yMd().format(_selectedDate)} & ${_selectedTime.format(context)}'),
                  ),
                  AdaptiveFlatButton(
                      handler: _presentDatePicker, text: 'Choose Date')
                ],
              ),
            ),
            RaisedButton(
              onPressed: _submitAction,
              child: Text('Add Expense'),
              color: Colors.purple,
              textColor: Theme.of(context).buttonColor,
            ),
          ],
        ),
      ),
    );
  }
}
