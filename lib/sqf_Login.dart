import 'package:app/cruddb.dart';
import 'package:app/dataBase.dart';
import 'package:app/dbEntity.dart';
import 'package:bassure/widgets/bassure_app_bar.dart';
import 'package:bassure/widgets/bassure_form_page.dart';
import 'package:bassure/widgets/bassure_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:app/dbEntity.dart';

import 'dbEntity.dart';

class SqfLogin extends StatefulWidget {
  @override
  _SqfLoginState createState() => _SqfLoginState();
}

class _SqfLoginState extends State<SqfLogin> {
  TextEditingController name = TextEditingController();
  TextEditingController mobilenumber = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _sckey = GlobalKey<ScaffoldState>();
  String namen = "----------";
  String mobno = "-------";
  @override
  void initState() {
    super.initState();

    init();
  }
  Future init() async {


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _sckey,
      appBar: BassureAppBar(
        appbarTitle: Text("BASSURE PACKAGE"),
      ),
      body: Column(
        children: [
          Container(
            child: BassureFormPage(
              formKey: _formKey,
              body: (validateForm) {
                return Container(
                  child: Column(
                    children: [
                      BassureTextFormField(
                        isPassword: false,
                        controller: name,
                        inputDecoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue[800]),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue[800]),
                          ),
                          fillColor: Colors.blue[800],
                          //hoverColor: Colors.blue[800],
                          labelText: 'Password',
                          hintText: 'Enter your Password',
                          labelStyle: TextStyle(color: Colors.deepOrange[400]),
                        ),
                        validate: (String value) {
                          if (value.isEmpty) {
                            return "Don't leave the field empty";
                          }
                          if (!RegExp("^(?=.{8,32}\$)(?=.*[a-z])(?=.*[0-9]).*")
                              .hasMatch(value)) {
                            return "Enter your password correctly";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      BassureTextFormField(
                        controller: mobilenumber,
                        inputDecoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue[800]),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue[800]),
                          ),
                          fillColor: Colors.blue[800],
                          labelText: 'Email Id',
                          labelStyle: TextStyle(
                            color: Colors.deepOrange[400],
                          ),
                          hintText: 'Enter your Email Id',
                        ),
                        validate: (String value) {
                          Pattern pattern =
                              r"^[a-zA-Z0-9.a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                          RegExp regexp = new RegExp(pattern);
                          if (value.isEmpty || !regexp.hasMatch(value)) {
                            return "Don't leave the field empty or use valid email-id";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),


          RaisedButton(
            child: Text(
              "SAVE",
              style: TextStyle(color: Colors.brown),
            ),
            onPressed: () async {
               await AppUserRepo().createUserDetail(user);
              print("user details......$user");


              setState(() {
                this.name.text = namen;
                this.mobilenumber.text = mobno;
              });
            },
            color: Colors.amberAccent,
          ),

          SizedBox(
            height: 20,
          ),

          Text(
            "$namen",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blue),
          ),

          SizedBox(
            height: 30,
          ),

          Text(
            "$mobno",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.red),
          )
        ],
      ),
    );
  }
}

