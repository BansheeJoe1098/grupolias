// ignore_for_file: deprecated_member_use, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../controllers/perfil.controller.dart';

class PerfilImgPicker extends StatefulWidget {
  final PerfilController perfilController;
  const PerfilImgPicker({Key? key, required this.perfilController})
      : super(key: key);

  @override
  State<PerfilImgPicker> createState() => _PerfilImgPickerState();
}

class _PerfilImgPickerState extends State<PerfilImgPicker> {
  late PerfilController controller;

  @override
  void initState() {
    super.initState();
    controller = widget.perfilController;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120.0,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Tomar foto desde",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Spacer(),
                FlatButton.icon(
                  color: Colors.white,
                  icon: const Icon(
                    Icons.camera,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    //Se toma foto de la camara
                    controller.tomarFoto(
                      ImageSource.camera,
                    );
                  },
                  label: const Text(
                    "Camara",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                const Spacer(),
                FlatButton.icon(
                  color: Colors.white,
                  icon: const Icon(
                    Icons.image,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    controller.tomarFoto(
                      //Se toma la foto desde la galeria
                      ImageSource.gallery,
                    );
                  },
                  label: const Text(
                    "Galeria",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                const Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
