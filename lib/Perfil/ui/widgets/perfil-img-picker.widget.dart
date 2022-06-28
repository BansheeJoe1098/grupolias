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
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                icon: const Icon(Icons.camera),
                onPressed: () {
                  controller.tomarFoto(ImageSource.camera);
                },
                label: const Text("Camara"),
              ),
              FlatButton.icon(
                icon: const Icon(Icons.image),
                onPressed: () {
                  controller.tomarFoto(ImageSource.gallery);
                },
                label: const Text("Galeria"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
