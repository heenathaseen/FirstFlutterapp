import 'package:bassure/widgets/bassure_app_bar.dart';
import 'package:bassure/widgets/bassure_form_page.dart';
import 'package:bassure/widgets/bassure_text_form_field.dart';
import 'package:flutter/material.dart';

import 'securestorage_entity.dart';


class flutterSecureStorage extends StatefulWidget {
  @override
  _flutterSecureStorageState createState() => _flutterSecureStorageState();
}

class _flutterSecureStorageState extends State<flutterSecureStorage> {
  TextEditingController econ = TextEditingController();
  TextEditingController pcon = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _sckey = GlobalKey<ScaffoldState>();
  String email = "----------";
  String pass = "-------";
  @override
  void initState() {
    super.initState();

    init();
  }
  Future init() async {
    email = await UserSecureStorage.getEmail();
    pass = await UserSecureStorage.getPass();


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
                        controller: pcon,
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
                        controller: econ,
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
              await UserSecureStorage.setEmail(econ.text);
              await UserSecureStorage.setPass(pcon.text);
              setState(() {
                this.econ.text = email;
                this.pcon.text = pass;
              });
            },
            color: Colors.amberAccent,
          ),

          SizedBox(
            height: 20,
          ),
          // RaisedButton(
          //   child: Text(
          //     "READ",
          //     style: TextStyle(color: Colors.brown),
          //   ),
          //   onPressed: () async {
          //     await UserSecureStorage.getEmail();
          //     await UserSecureStorage.getPass();
          //   },
          //   color: Colors.amberAccent,
          // ),

          Text(
            "$email",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blue),
          ),

          SizedBox(
            height: 30,
          ),

          Text(
            "$pass",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.red),
          )
        ],
      ),
    );
  }
}
