import 'package:app/form.dart';
import 'package:app/home.dart';
import 'package:app/main_drawer.dart';
import 'package:app/other.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';

import 'fetch.dart';

void main() {
  runApp(
    MaterialApp(home: MyApp(),
    debugShowCheckedModeBanner: false,),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _page =0;
  final _pageOption=[
    home(),
    form(),
    fetch(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('Just Baked', style: TextStyle(color: Colors.pinkAccent,
          fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,
          
        )),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.pinkAccent), //add this line here


      ),
      body: _pageOption[_page],


      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        color: Colors.white ,
        backgroundColor:Colors.pinkAccent,
        buttonBackgroundColor:Colors.white ,


        items: [

          Icon(Icons.home,size:20,color:Colors.pinkAccent ,),
          Icon(Icons.person,size:20,color:Colors.pinkAccent ,),
          Icon(Icons.list,size:20,color:Colors.pinkAccent ,),



        ],

        animationDuration: Duration(
          milliseconds: 200
        ),
        animationCurve: Curves.bounceInOut,
        onTap: (index){
          setState(() {
            _page = index;
          });
        },
      ),
      drawer: MainDrawer(


      ),
    );
  }
}
