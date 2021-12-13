import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'putCall.dart';

class UserData {
  dynamic regno;
  String name;
  String dept;
  String collegename;


  UserData({this.regno, this.name, this.dept, this.collegename});

  // factory UserData.fromJson(Map<String, dynamic> data) {
  //   return UserData(id: data["id"],
  //       postId: data["postId"],
  //       name: data["name"],
  //       email: data["email"],
  //       body: data["body"]);
  // }

  Map<String, dynamic> toJson() {
    return {
      "regno": regno,
      "name": name,
      "dept": dept,
      "collegename": collegename,
    };
  }
}

class postCall extends StatefulWidget {
  @override
  _postCallState createState() => _postCallState();
}

class _postCallState extends State<postCall> {
  TextEditingController regnoController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController deptController = TextEditingController();
  TextEditingController collegenameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(

          child: Container(
            height: 500,
            width: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.all(Radius.circular(20.0)),
                //color: Color(0xFFF5D9D9),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10.0,
                      offset: Offset(0.0, 10.0)
                  )
                ]

            ),
            child: Card(elevation: 0.0,


              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: regnoController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),

                        labelText: "regno"
                    ),
                  ),
                  SizedBox(height: 40,),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),

                        labelText: "name"
                    ),
                  ),
                  SizedBox(height: 40,),
                  TextFormField(
                    controller: deptController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),

                        labelText: "dept"
                    ),
                  ),
                  SizedBox(height: 40,),
                  TextFormField(
                    controller: collegenameController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                        labelText: "email"
                    ),
                  ),
                  SizedBox(height: 40,),


                  Row(
                    children: [
                      SizedBox(width: 40,),

                      ElevatedButton(child: Text("submit"), onPressed:
                          () async {
                        UserData ud = UserData(
                            regno: int.parse(regnoController.text),

                            name: nameController.text,
                            dept: deptController.text,
                             collegename: collegenameController.text,

                        );


                        Response response = await post(
                            "https://1bcd43b723fb.ngrok.io/postdetail",
                            headers: {"Content-type": "application/json"},
                            body: jsonEncode(ud.toJson()));
                        print(response.statusCode);
                        print(response.body);
                      }),
                      SizedBox(width: 100,),
                      ElevatedButton(onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => putCall()),
                        );
                      }, child: Text(
                          'PutCall'
                      ))
                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}