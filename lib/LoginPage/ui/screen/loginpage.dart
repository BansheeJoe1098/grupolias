import 'package:flutter/material.dart';
import '../../../NavBar/ui/pluguin/navbar.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({Key? key}) : super(key: key);

  Widget _buildPageContent(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
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
              const ListTile(
                  title: TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    hintText: "Correo Electronico:",
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.email,
                      color: Colors.black,
                    )),
              )),
              const Divider(
                color: Colors.black,
              ),
              const ListTile(
                  title: TextField(
                obscureText: true,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    hintText: "Contraseña:",
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.lock,
                      color: Colors.black,
                    )),
              )),
              const Divider(
                color: Colors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BasicBottomNavBar()),
                        );
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      color: Colors.black,
                      child: const Text(
                        'Iniciar Sesion',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageContent(context),
    );
  }
}
