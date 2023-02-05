import 'dart:ffi';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:snow_rewards/main.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() {
    Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Root()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text(
            'Splash Screen',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
