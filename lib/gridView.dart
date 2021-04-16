import 'package:flutter/material.dart';

class gridView extends StatefulWidget {
  @override
  _gridViewState createState() => _gridViewState();
}

class _gridViewState extends State<gridView> {
  final List<String> _listItem = [
    'images/2.jpg',
    'images/3.jpg',
    'images/4.jpg',
    'images/5.jpg',
    'images/b1.jpg',
    'images/c1.jpg',
    'images/c2.jpg',
    'images/c3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("grid"),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(10),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: _listItem
                  .map((item) => Card(
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(item), fit: BoxFit.cover)),
                        ),
                      )).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
