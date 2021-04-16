import 'package:flutter/material.dart';

class form extends StatefulWidget {
  @override
  _formState createState() => _formState();
}

class _formState extends State<form> {
  SelectedValue(value){
    setState(() {
      selected = value;
    });
  }

  int selected;
  String _name;
  String _email;
  String _password;
  String _url;
  String _phoneNumber;
  String _calorie;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String valuechoose;
  List ListItem = ["chennai", "vellore", "Ranipet", "salem"];

  Widget _buildName() {
    return TextFormField(
      decoration:
          InputDecoration(border: OutlineInputBorder(), labelText: 'Name'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
        decoration:
            InputDecoration(border: OutlineInputBorder(), labelText: 'Email'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Email is Required'
            ;
          }
          onSaved:
          (String value) {
            _email = value;
          };
        });
  }

  Widget _buildPassword() {
    return null;
  }

  Widget _buildurl() {
    return null;
  }

  Widget _buildphonenumber() {
    return null;
  }

  Widget _buildcalorie() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildName(),
              // _buildEmail(),
              // _buildPassword(),
              // _buildurl(),
              // _buildphonenumber(),
              // _buildcalorie(),

              SizedBox(
                height: 10,
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(border: OutlineInputBorder()),
                hint: Text("Select cities:"),
                value: valuechoose,
                onChanged: (newvalue) {
                  setState(() {
                    valuechoose = newvalue;
                  });
                },
                items: ListItem.map((valueItem) {
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(valueItem),
                  );
                }).toList(),
              ),
              RadioListTile(
                title:  Text('Male'),
                value: 1,
                groupValue: selected,
                onChanged: (value) {
                  SelectedValue(value);
                },
              ),
              RadioListTile(
                title:  Text('Female'),
                value: 2,
                groupValue: selected,
                onChanged: (value) {
                  SelectedValue(value);
                },
              ),

              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                child: Text(
                  'submit',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                onPressed: () {
                  if (!_formkey.currentState.validate()) {
                    return;
                  }
                  _formkey.currentState.save();
                  print(_name);
                  // print(_email);
                  // print(_password);
                  // print(_url);
                  // print(_phoneNumber);
                  // print(_calorie);
                },
              )
            ],
          ),
        ));
  }
}
