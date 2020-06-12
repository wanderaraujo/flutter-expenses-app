import 'package:expenses/components/adaptative_button.dart';
import 'package:expenses/components/adaptative_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'adaptative_text_field.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectecDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0 || _selectecDate == null) return;

    widget.onSubmit(title, value, _selectecDate);
  }

 

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: <Widget>[
              AdaptativeTextField(
                label: 'Título',
                controller: _titleController,
                onSubmitted: (_) => _submitForm()
              ),
              // TextField(
              //   onSubmitted: (_) => _submitForm(),
              //   controller: _titleController,
              //   decoration: InputDecoration(labelText: 'Título'),
              // ),
              AdaptativeTextField(
                label: 'Valor (R\$)',
                type: TextInputType.numberWithOptions(decimal: true),
                controller: _valueController,
              ),
              // TextField(
              //   controller: _valueController,
              //   keyboardType: TextInputType.numberWithOptions(decimal: true),
              //   onSubmitted: (_) => _submitForm(),
              //   decoration: InputDecoration(
              //     labelText: 'Valor (R\$)',
              //   ),
              // ),
              AdaptativeDatePicker(
                selectedDate: _selectecDate,
                onDateChange: (newDate){
                  setState(() {
                    _selectecDate = newDate;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  AdaptativeButton(
                    label: 'Nova Transação',
                    onPressed: _submitForm,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
