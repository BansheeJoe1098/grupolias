import 'dart:io';

import 'package:flutter/material.dart';
import '../../controllers/login.controller.dart';
import 'package:get/get.dart';
import 'package:grupolias/Global/controllers/global.controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginController = Get.put(LoginController());
  final globalController = Get.put(GlobalController());
  bool _isObscure = true;
  ver() async {
    try {
      await globalController.isAutenticado();
    } catch (e) {
      if (e is SocketException) {
        Get.snackbar(
          'Error',
          'No se pudo conectar con el servidor, revise su conexion a internet',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          icon: const Icon(
            Icons.error,
            color: Colors.white,
          ),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    ver();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Container(
              margin: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100.0),
                    topLeft: Radius.circular(100.0),
                    bottomLeft: Radius.circular(100.0),
                    bottomRight: Radius.circular(100.0)),
              ),
              child: Image.asset(
                'assets/gpolias.png',
                width: 250,
                height: 250,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Form(
              key: loginController.formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: loginController.usuario,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        hintText: "Usuario",
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: loginController.password,
                      obscureText: _isObscure,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: "Contraseña:",
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                        hintStyle: const TextStyle(color: Colors.black),
                        border: InputBorder.none,
                        icon: const Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                            onPressed: () {
                              loginController.login();
                              //Get.to(Home());
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            color: Colors.black,
                            child: const Text(
                              'Iniciar Sesion',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    const Text(
                      '💻 BY THE CORE DEV 💻',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
