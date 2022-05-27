import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  DatePicker({Key? key}) : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2025),
        initialEntryMode: DatePickerEntryMode.input,
        helpText: 'FECHA',
        cancelText: 'Cancelar',
        confirmText: 'Confirmar',
        fieldLabelText: 'Escriba Fecha',
        fieldHintText: 'Mes/Dia/Año',
        errorFormatText: 'Escriba una fecha');
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextButton(
              onPressed: () => _selectDate(context),
              child: Text(
                  "${selectedDate.month}/${selectedDate.day}/${selectedDate.year}"
                      .split(' ')[0],
                  style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: Colors.black54,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                      decorationColor: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }
}
