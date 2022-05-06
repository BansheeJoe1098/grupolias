import 'package:flutter/material.dart';
import 'navbar.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({Key? key}) : super(key: key);

  Widget _buildPageContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      color: Colors.blue.shade800,
      child: ListView(
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
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(100.0),
                      bottomRight: Radius.circular(30.0)),
                ),
              ),
              const SizedBox(
                height: 50,
              ),

              const ListTile(
                  title: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: "Email address:",
                    hintStyle: TextStyle(color: Colors.white70),
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.email,
                      color: Colors.white30,
                    )),
              )),
              const Divider(
                color: Colors.greenAccent,
              ),
              const ListTile(
                  title: TextField(
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: "Password:",
                    hintStyle: TextStyle(color: Colors.white70),
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.lock,
                      color: Colors.white30,
                    )),
              )),
              const Divider(
                color: Colors.greenAccent,
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
                      color: Colors.green,
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white70, fontSize: 16.0),
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
