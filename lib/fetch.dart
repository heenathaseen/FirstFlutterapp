import 'dart:convert';

import 'package:app/fetchone.dart';
import 'package:app/gridView.dart';
import 'package:app/sample.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'fetchall.dart';


class fetch extends StatefulWidget {
  @override
  _fetchState createState() => _fetchState();
}

class _fetchState extends State<fetch> {


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => fetchone()),
                );
              },
              child: Text("getone")),
        ),
       Container(
          padding: EdgeInsets.all(20),
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => gridView()),
                );
              },
             child: Text("getall")),
       )
      ],
    );
  }
}
