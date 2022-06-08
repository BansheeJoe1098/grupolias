import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grupoLias/Signature_Form/ui/signature.dart';

class Perfil extends StatelessWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'GRUPO LIAS',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 25.0,
            letterSpacing: 2.0,
          ),
        ),
        backgroundColor: Colors.black,
        toolbarHeight: 80,
        actions: const <Widget>[
          ImageIcon(
            AssetImage('assets/gpolias.png'),
            size: 100,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(left: 50.0, top: 50.0, right: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/profile.png'),
                backgroundColor: Colors.black,
                radius: 60.0,
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            const Text(
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
            const Text(
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
            const Text(
              'Plomero \n Electricista',
              style: TextStyle(
                color: Color.fromARGB(255, 102, 100, 100),
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
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
              children: const [
                Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'jose.garcia@flutter.prof',
                  style: TextStyle(
                      letterSpacing: 1.0, color: Colors.black, fontSize: 18.0),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
                onPressed: () async {
                  Get.to(Signature());
                },
                child: const Text('Firma'))
          ],
        ),
      ),
    );
  }
}
