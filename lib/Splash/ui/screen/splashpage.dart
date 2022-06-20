// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import '../../../LoginPage/ui/screen/loginpage.dart';

class MySplashPage extends StatefulWidget {
  const MySplashPage({
    Key? key,
  }) : super(key: key);

  @override
  _MySplashPageState createState() => _MySplashPageState();
}

class _MySplashPageState extends State<MySplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 1),
      () => Get.to(() => const SecondScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.asset(
        'assets/gpolias.png',
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: LoginPage());
  }
}
