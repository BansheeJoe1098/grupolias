import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:grupoLias/Global/controllers/global.controller.dart';
import '../../../NavBar/ui/pluguin/navbar.dart';
import '../../controllers/login.controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = Get.put(LoginController());
  final globalController = Get.put(GlobalController());

  ver() async {
    await globalController.isAutenticado();
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
              child: Image.asset(
                'assets/gpolias.png',
                width: 250,
                height: 250,
              ),
              margin: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100.0),
                    topLeft: Radius.circular(100.0),
                    bottomLeft: Radius.circular(100.0),
                    bottomRight: Radius.circular(100.0)),
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
                      obscureText: true,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        hintText: "Contraseña:",
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                      ),
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
