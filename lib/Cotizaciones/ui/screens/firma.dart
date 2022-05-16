import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class MyCanvaPage extends StatefulWidget {
  MyCanvaPage({Key? key}) : super(key: key);

  @override
  MyCanvaPageState createState() => MyCanvaPageState();
}

class MyCanvaPageState extends State<MyCanvaPage> {
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  void Limpiar() {
    signatureGlobalKey.currentState!.clear();
  }

  void Guardar() async {}
  _toastInfo(String info) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(info),
    ));
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();
    return Scaffold(
        body: Column(
            children: [
          Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                  child: SfSignaturePad(
                      key: signatureGlobalKey,
                      backgroundColor: Colors.white,
                      strokeColor: Colors.black,
                      minimumStrokeWidth: 3.0,
                      maximumStrokeWidth: 5.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)))),
          SizedBox(height: 10),
          Row(children: <Widget>[
            TextButton(
              child: Text('Guardar'),
              onPressed: Guardar,
            ),
            TextButton(
              child: Text('Limpiar'),
              onPressed: Limpiar,
            )
          ], mainAxisAlignment: MainAxisAlignment.spaceEvenly)
        ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center));
  }
}
