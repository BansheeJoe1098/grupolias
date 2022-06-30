import 'package:flutter/material.dart';

class BotonTomarFoto extends StatelessWidget {
  const BotonTomarFoto({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: Colors.transparent,
      child: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Presiona para tomar foto",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Image.asset("assets/gpolias.png"),
          ],
        ),
      ),
    );
  }
}
