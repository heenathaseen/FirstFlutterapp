import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'putCall.dart';

class UserData {
  dynamic postId;
  dynamic id;
  String name;
  String email;
  String body;


  UserData({this.postId, this.id, this.name, this.email, this.body});

  factory UserData.fromJson(Map<String, dynamic> data) {
    return UserData(id: data["id"],
        postId: data["postId"],
        name: data["name"],
        email: data["email"],
        body: data["body"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "PostId": postId,
      "name": name,
      "email": email,
      "body": body
    };
  }
}

class postCall extends StatefulWidget {
  @override
  _postCallState createState() => _postCallState();
}

class _postCallState extends State<postCall> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController bodyController = TextEditingController();


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
                    controller: nameController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),

                        labelText: "name"
                    ),
                  ),
                  SizedBox(height: 40,),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                        labelText: "email"
                    ),
                  ),
                  SizedBox(height: 40,),
                  TextFormField(
                    controller: bodyController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),

                        labelText: "Body"
                    ),
                  ),
                  SizedBox(height: 100,),

                  Row(
                    children: [
                      SizedBox(width: 40,),

                      ElevatedButton(child: Text("submit"), onPressed:
                          () async {
                        UserData ud = UserData(
                            email: emailController.text,

                            name: nameController.text,
                            body: bodyController.text,
                            id: 1,
                            postId: 1
                        );


                        Response response = await post(
                            "https://jsonplaceholder.typicode.com/comments",
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