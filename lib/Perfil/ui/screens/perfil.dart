import 'dart:convert';

import 'package:flutter/material.dart';

class perfil extends StatelessWidget {
  const perfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GRUPO LIAS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
            letterSpacing: 2.0,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(left: 50.0, top: 50.0, right: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.0,
            ),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/profile.png'),
                radius: 60.0,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Text(
              'Jose Garcia',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              '4431256540',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'Plomero\nElectricista',
              style: TextStyle(
                color: Color.fromARGB(255, 102, 100, 100),
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'Mexico,DF',
              style: TextStyle(
                color: Color.fromARGB(255, 95, 94, 92),
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  'jose.garcia@flutter.prof',
                  style: TextStyle(
                      letterSpacing: 1.0, color: Colors.black, fontSize: 18.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
