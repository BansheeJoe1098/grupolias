import 'package:flutter/material.dart';

import '../../controllers/acuerdo-conformidad.controller.dart';

class AltaUsuariosFinalesForm extends StatelessWidget {
  const AltaUsuariosFinalesForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AcuerdoConformidadController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.usuarioFinalFormKey,
      child: Column(
        children: [
          /**************** INPUT DE TELEFONO DEL USAURIO FINAL *******************/
          TextFormField(
            textAlignVertical: TextAlignVertical.top,
            controller: controller.telefono,
            maxLength: 10,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value!.length > 10) {
                return 'El telefono no puede tener más de 10 caracteres';
              }
              if (value == "") {
                return 'El telefono es requerido';
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'Telefono del usuario atendido',
              hintText: "55 5555 5555",
              floatingLabelStyle: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              filled: true,
              fillColor: Color.fromARGB(255, 230, 230, 230),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.zero),
                borderSide: BorderSide.none,
              ),
              focusedBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.zero),
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              errorStyle: TextStyle(
                color: Colors.red,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(height: 15),

          /**************** INPUT DE NOMBRE DEL USAURIO FINAL *******************/
          TextFormField(
            textAlignVertical: TextAlignVertical.top,
            controller: controller.nombreUsuario,
            maxLength: 50,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.characters,
            validator: (value) {
              if (value!.length > 50) {
                return 'El nombre no puede tener más de 50 caracteres';
              }
              if (value == "") {
                return 'Nombre del usuario es requerido';
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'Nombre del usuario',
              floatingLabelStyle: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              filled: true,
              fillColor: Color.fromARGB(255, 230, 230, 230),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.zero),
                borderSide: BorderSide.none,
              ),
              focusedBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.zero),
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              errorStyle: TextStyle(
                color: Colors.red,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(height: 15),

          /******** INPUT DE APELLIDO PATERNO DEL USAURIO FINAL ***********/
          TextFormField(
            textAlignVertical: TextAlignVertical.top,
            controller: controller.aPaterno,
            maxLength: 50,
            textCapitalization: TextCapitalization.characters,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value!.length > 50) {
                return 'El apellido paterno no puede tener más de 50 caracteres';
              }
              if (value == "") {
                return 'El apellido paterno atendido es requerido';
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'Apellido Paterno',
              floatingLabelStyle: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              filled: true,
              fillColor: Color.fromARGB(255, 230, 230, 230),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.zero),
                borderSide: BorderSide.none,
              ),
              focusedBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.zero),
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              errorStyle: TextStyle(
                color: Colors.red,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(height: 15),

          /********* INPUT DE APELLIDO MATERNO DEL USAURIO FINAL *************/
          TextFormField(
            textAlignVertical: TextAlignVertical.top,
            controller: controller.aMaterno,
            maxLength: 50,
            textCapitalization: TextCapitalization.characters,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value!.length > 50) {
                return 'El apellido materno no puede tener más de 50 caracteres';
              }
              if (value == "") {
                return 'El apellido materno atendido es requerido';
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'Apellido Materno',
              floatingLabelStyle: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              filled: true,
              fillColor: Color.fromARGB(255, 230, 230, 230),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.zero),
                borderSide: BorderSide.none,
              ),
              focusedBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.zero),
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              errorStyle: TextStyle(
                color: Colors.red,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(height: 15),

          /********* INPUT DE CORREO DEL USAURIO FINAL *************/
          TextFormField(
            textAlignVertical: TextAlignVertical.top,
            controller: controller.email,
            maxLength: 100,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              value = value!.split(" ").join("");
              //Email Regex expression
              RegExp regex = RegExp(
                r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
              );

              if (!regex.hasMatch(value)) {
                return 'El correo electrónico no es valido';
              }
              if (value.length > 50) {
                return 'El correo no puede tener más de 100 caracteres';
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'Correo Electrónico',
              floatingLabelStyle: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              filled: true,
              fillColor: Color.fromARGB(255, 230, 230, 230),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.zero),
                borderSide: BorderSide.none,
              ),
              focusedBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.zero),
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              errorStyle: TextStyle(
                color: Colors.red,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
