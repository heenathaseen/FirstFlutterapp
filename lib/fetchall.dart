import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';



class UserData{
  dynamic userId;
  dynamic id;
  String title;
  String body;

  UserData({this.userId, this.id, this.title, this.body});

  factory UserData.fromJson(Map<String, dynamic> data) {
    return UserData(id: data["id"], userId:data["userId"], title:data["title"], body:data["body"]);
  }
  //
  // Map<String, dynamic> toJson() {
  //   return {
  //     "id": id,
  //     "userId": userId,
  //     "title": title,
  //     "body": body
  //   };
  // }
}
class fetchall extends StatefulWidget {
  @override
  _fetchallState createState() => _fetchallState();
}
class _fetchallState extends State<fetchall> {
   Future<List<UserData>> ltt()async {
    List<UserData> lt = [];
    Response response = await get("https://jsonplaceholder.typicode.com/posts",
        headers: {"Content-type": "application/json"});
    try {
      List<dynamic> data = jsonDecode(response.body);
      print(data[0]);
      for (int i = 0; i <= data.length; i++) {
        lt.add(UserData.fromJson(data[i]));
      }
      print(lt);
    } catch (e) {
      print(e);
    }

   return lt;


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("fetchall"),
      ),
      body:
      FutureBuilder(
        future: ltt(),

        builder: (context,snapshot){
          if(snapshot.hasData){
            List<UserData> lt=snapshot.data;
            return Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [

                  SizedBox(height: 100,),
                  Flexible(
                    child: Container(
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: lt.length,
                        itemBuilder:(context,index){
                          return Container(
                            child: Text("Userid:${lt[index].userId}\nTitle: ${lt[index].title}\n Id:${lt[index].id}",style: TextStyle(fontSize: 20)),
                          );
                        },
                      ),
                    ),
                  ),

                ],
              ),
            );
          }else if(snapshot.hasError){
            return Container(child: Center(child: Text("getting error")),);
          }
          else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}