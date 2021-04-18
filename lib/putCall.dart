import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

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

class putCall extends StatefulWidget {
  @override
  _putCallState createState() => _putCallState();
}

class _putCallState extends State<putCall> {
  Future<UserData> userData;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  Future<UserData> getOneData() async {
    Response response = await get("https://jsonplaceholder.typicode.com/comments/1",
        headers: {"Content-type": "application/json"});
    dynamic userData=jsonDecode(response.body);
    return UserData.fromJson(userData);
  }
  @override
  void initState() {
    // TODO: implement initState
    userData=getOneData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: userData,
          builder: (context, snapshot) {
            print(snapshot.error);
            if (snapshot.hasData) {
              UserData u = snapshot.data;
              nameController.text = u.name;
              emailController.text = u.email;
              bodyController.text = u.body;
              return Center(
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
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                              labelText: "name",
                            contentPadding: EdgeInsets.all(10.0),

                          ),
                        ),
                        SizedBox(height: 40,),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                              labelText: "email",
                            contentPadding: EdgeInsets.all(10.0),

                          ),
                        ),
                        SizedBox(height: 40,),
                        TextFormField(
                          controller: bodyController,
                          decoration: InputDecoration(
                              labelText: "Body",
                            contentPadding: EdgeInsets.all(10.0),

                          ),
                        ),
                        ElevatedButton(child: Text("submit"), onPressed:
                            () async {
                          UserData ud = UserData(
                              email: emailController.text,

                              name: nameController.text,
                              body: bodyController.text,
                              id: 1,
                              postId: 1
                          );


                       Response response = await put("https://jsonplaceholder.typicode.com/comments/1",
                           headers: {"Content-type": "application/json"},
                           body: jsonEncode(ud.toJson()));
                              print(response.statusCode);
                              print(response.body);
                        })
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }
      ),
    );
  }
}