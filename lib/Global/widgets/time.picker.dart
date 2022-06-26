import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({Key? key}) : super(key: key);

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  String? selectedtime;

  Future<void> displayTimeDialog() async {
    final TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        initialEntryMode: TimePickerEntryMode.input,
        errorInvalidText: 'No es valido',
        confirmText: 'Confirmar',
        cancelText: 'Cancelar',
        helpText: 'Escriba la hora');
    if (time != null) {
      setState(() {
        selectedtime = time.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          TextButton(
              onPressed: displayTimeDialog,
              child: Text(
                selectedtime != null ? '$selectedtime' : '00:00',
                style: const TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    color: Colors.black54,
                    decoration: TextDecoration.underline,
                    decorationThickness: 2,
                    decorationColor: Colors.red),
              ))
        ],
      )),
    );
  }
}
