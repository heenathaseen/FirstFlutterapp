import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class UserData{
  dynamic userId;
  dynamic id;
  String title;
  String body;
  UserData({this.title,this.body,this.id,this.userId});
  factory UserData.fromJson(Map<String, dynamic> data) {
    return UserData(id: data["id"], userId:data["userId"], title:data["title"], body:data["body"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "userId": userId,
      "title": title,
      "body": body
    };
  }
}
class fetchone extends StatefulWidget {
  @override
  _fetchoneState createState() => _fetchoneState();
}

class _fetchoneState extends State<fetchone> {
  Future<UserData> getOneData() async {
    Response response = await get(
        "https://jsonplaceholder.typicode.com/posts/1",
        headers: {"Content-type": "application/json"});
    dynamic userData = jsonDecode(response.body);
    return UserData.fromJson(userData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("fetchone"),
      ),
      body:
      FutureBuilder(
        future: getOneData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData lt = snapshot.data;
            return Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [

                  SizedBox(height: 100,),
                  Flexible(
                    child: Container(
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Text("${lt.userId}\n${lt
                                .title}\n ${lt.id}",
                                style: TextStyle(fontSize: 20)),
                          );
                        },
                      ),
                    ),
                  ),

                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Container(child: Center(child: Text("getting error")),);
          }
          else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}