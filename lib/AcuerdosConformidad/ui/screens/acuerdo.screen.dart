import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:GrupoLias/Cotizaciones/model/cotizacion.model.dart';
import 'package:GrupoLias/Signature_Form/ui/signature.dart';
import 'package:GrupoLias/Tickets/model/ticket.model.dart';
import 'package:GrupoLias/Tickets/service/ticket.service.dart';
import 'package:GrupoLias/Date_Time_Picker/Screen/date_picker.dart';
import 'package:GrupoLias/Date_Time_Picker/Screen/time_picker.dart';

class AcuerdoConformidadScreen extends StatefulWidget {
  final Cotizacion cotizacion;
  const AcuerdoConformidadScreen({Key? key, required this.cotizacion})
      : super(key: key);

  @override
  State<AcuerdoConformidadScreen> createState() =>
      _AcuerdoConformidadScreenState();
}

class _AcuerdoConformidadScreenState extends State<AcuerdoConformidadScreen> {
  late Cotizacion cotizacion;
  late Ticket ticketDeCotizacion;

  ticketDeCotizacionById() async {
    var service = TicketService();
    var ticket = await service.getTicketById(cotizacion.ticketId!);
    setState(() {
      ticketDeCotizacion = ticket;
    });
  }

  @override
  void initState() {
    super.initState();
    cotizacion = widget.cotizacion;
    ticketDeCotizacionById();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Acuerdo Conformidad"),
        toolbarHeight: 80,
        actions: const [
          ImageIcon(
            AssetImage('assets/gpolias.png'),
            size: 80,
          ),
        ],
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Descripcion del Problema 👀 ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      maxLines: 5,
                      textAlignVertical: TextAlignVertical.top,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        labelText: 'Descripcion del problema  ',
                        hintText: 'Ej: Fuga de agua en el baño',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Actividades Realizadas 📃",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      maxLines: 5,
                      textAlignVertical: TextAlignVertical.top,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        labelText: 'Actividades Realizadas',
                        hintText: 'Ej: Se cambio el tubo del agua',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (text) {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Direccion ❔",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      maxLines: 2,
                      textAlignVertical: TextAlignVertical.top,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        labelText: 'Direccion',
                        hintText: 'Ej: Calle Oropeza,Colonia Industrial,N°5',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (text) {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Observaciones 👁",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      maxLines: 5,
                      textAlignVertical: TextAlignVertical.top,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        labelText: 'Observaciones',
                        hintText: 'Ej:Se hizo correctamente el trabajo',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (text) {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Fecha  y Hora de Acuerdo 🕰",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 120,
                          height: 60,
                          padding: const EdgeInsets.all(2),
                          margin: const EdgeInsets.all(2),
                          child: const DatePicker(),
                        ),
                        Container(
                          width: 120,
                          height: 60,
                          padding: const EdgeInsets.all(2),
                          margin: const EdgeInsets.all(2),
                          child: const TimePicker(),
                        ),
                      ],
                    ),
                    Center(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Colors.black,
                              ),
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.all(20)),
                              textStyle: MaterialStateProperty.all(
                                  const TextStyle(fontSize: 20))),
                          child: const Text("Firmar"),
                          onPressed: () {
                            Get.to(const Signature());
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
