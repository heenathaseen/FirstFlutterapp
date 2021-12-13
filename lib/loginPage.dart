import 'package:bassure/widgets/bassure_form_page.dart';
import 'package:bassure/widgets/bassure_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class loginpage extends StatefulWidget {
  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BassureFormPage(
        formKey: _formKey,
        body: (validateForm) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BassureTextFormField(
                    controller: nameController,
                    inputDecoration: InputDecoration(
                      hintText: 'Enter name',
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.black, width: 5.0),
                      ),
                    ),
                  ),
                  BassureTextFormField(
                    controller: passwordController,
                    inputDecoration: InputDecoration(
                      hintText: 'Enter password'
                          '',
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.black, width: 5.0),
                      ),
                    ),
                  ),
                  ElevatedButton(onPressed: (){}, child: Text("Login",
                      style: TextStyle(
                        //backgroundColor: Colors.pink,
                        //color: Colors.white,

                          fontSize: 20)),),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
