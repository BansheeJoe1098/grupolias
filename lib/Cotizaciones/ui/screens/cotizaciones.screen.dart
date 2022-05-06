import 'package:flutter/material.dart';

class CotizacionesScreen extends StatelessWidget {
  const CotizacionesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var onPressed;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(
              top: 30,
            ),
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
            child: const Text(
              'Crear una cotizacion',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(
                bottom: 30,
                top: 30,
              ),
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 5,
                left: 4,
                right: 4,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          labelText: 'Descripcion del problema',
                          labelStyle: TextStyle(fontSize: 20),
                          hintText: 'Descripcion',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Color.fromARGB(71, 226, 208, 208),
                          hintMaxLines: 50,
                          contentPadding: EdgeInsets.all(20.0)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),



                    showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
      helpText: "SELECT BOOKING DATE",
      cancelText: "NOT NOW",
      confirmText: "BOOK NOW",
      initialDatePickerMode: DatePickerMode.year
    );
                    const SizedBox(
                      height: 20,
                    ),
                    const TextField(
                      // controller: costoController,
                      decoration: InputDecoration(
                        hintText: '0.00',
                        labelText: 'Costo Mano de obra',
                        prefixIcon: Icon(Icons.monetization_on_outlined),
                        //icon: Icon(Icons.monetization_on),
                        /*  suffixIcon: IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () => costoController.clear(),
                        ),*/
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TextField(
                      //controller: _costoController,
                      decoration: InputDecoration(
                        hintText: '0.00',
                        labelText: 'Costo  Materiales',
                        prefixIcon: Icon(Icons.monetization_on_outlined),
                        //icon: Icon(Icons.monetization_on),
                        /*   suffixIcon: IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () => _costoController.clear(),
                        ),*/
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TextField(
                      // controller: costoController,
                      decoration: InputDecoration(
                        hintText: '0.00',
                        labelText: 'Total',
                        prefixIcon: Icon(
                          Icons.monetization_on_sharp,
                          color: Colors.yellow,
                        ),
                        //icon: Icon(Icons.monetization_on),
                        /*  suffixIcon: IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () => costoController.clear(),
                        ),*/
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(
                            top: 5,
                            left: 10,
                            right: 5,
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 125,
                              ),
                              ElevatedButton(
                                  child: Text("Guardar"), onPressed: () {}),
                              SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
                                  child: Text("Enviar"), onPressed: () {}),
                            ],
                          ),
                        )
                      ],
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
