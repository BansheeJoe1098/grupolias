import 'dart:io';

import 'package:flutter/material.dart';

import '../../model/acuerdo-conformidad.model.dart';

class VerAcuerdoFirmadoScreen extends StatefulWidget {
  final AcuerdoConformidad acuerdoConformidad;
  final File firma;
  const VerAcuerdoFirmadoScreen(
      {Key? key, required this.acuerdoConformidad, required this.firma})
      : super(key: key);

  @override
  State<VerAcuerdoFirmadoScreen> createState() =>
      _VerAcuerdoFirmadoScreenState();
}

class _VerAcuerdoFirmadoScreenState extends State<VerAcuerdoFirmadoScreen> {
  late AcuerdoConformidad acuerdoConformidad;
  late File firma;

  @override
  void initState() {
    super.initState();
    acuerdoConformidad = widget.acuerdoConformidad;
    firma = widget.firma;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acuerdo firmado'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(child: Text(acuerdoConformidad.id!.toString())),
        ),
      ),
    );
  }
}
