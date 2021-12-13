import 'package:app/bassureForm.dart';
import 'package:app/fluttersecurestorage.dart';
import 'package:app/home.dart';
import 'package:app/loginPage.dart';
import 'package:app/sqf_Login.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.pinkAccent,
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 30, bottom: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('images/splash.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Text(
                    'Heena',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  Text(
                    'Heena@gmail.com',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Person',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder:(context)=>bassureForm()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'settings',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder:(context)=>loginpage()));

            } ,
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder:(context)=>flutterSecureStorage()));

            }  ,
          ),
          ListTile(
            leading: Icon(Icons.storage),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder:(context)=>SqfLogin()));

            }  ,
          )
        ],
      ),
    );
  }
}
