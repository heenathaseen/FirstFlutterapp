import 'package:flutter/material.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.center,
      child: Center(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 20,

              ),
              Text('Welcome to Just Baked',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.italic)),
              SizedBox(
                height: 20,
              ),
              Text('Taste the Untasted flavours of the food',

                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w200,
                      fontStyle: FontStyle.italic,backgroundColor: Color(0xFFEE729C)))
            ],


          ),
        ),
      ),
    );
  }
}
