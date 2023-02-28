import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quotes_app/screen/homepage.dart';

import '../global.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  var intValue = Random().nextInt(30);
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                HomePage(),
            )
        )
    );
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text(
          list[intValue]['Quote'],
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
    );
  }

}
