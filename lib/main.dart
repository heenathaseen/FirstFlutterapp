import 'dart:async';

import 'package:app/heena.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(
    MaterialApp(home: splash(),
      debugShowCheckedModeBanner: false,),
  );
}

class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {


  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 5),
            () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyApp(
        )
        )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body:Center(
        child:
        Image.asset('images/splash.png'),
      )
    );
  }
}
