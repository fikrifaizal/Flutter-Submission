import 'package:flutter/material.dart';
import 'package:covinfo/MainScreen.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen>{
  @override
  void initState(){
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var durasi = const Duration(seconds: 5);
    return Timer(durasi, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return MainScreen();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/covid.png',
              width: 130,
              height: 130,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Cov',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Info',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}