import 'package:flutter/material.dart';

class grid extends StatefulWidget {
  @override
  _gridState createState() => _gridState();
}

class _gridState extends State<grid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Our Specialities',
          style: TextStyle(color: Colors.pinkAccent),
        ),
      ),

    );
  }
}
