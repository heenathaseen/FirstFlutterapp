import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SampleData{
  String desc;
  String title;
  SampleData({this.desc,this.title});
}

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
class Sample extends StatefulWidget {
  @override
  _SampleState createState() => _SampleState();
}
class _SampleState extends State<Sample> {
//  Future<List> num=Future.value([1,2,3,4,5,6,7]);
  Future<UserData> getOneData() async {
    Response response = await get("https://jsonplaceholder.typicode.com/posts/1",
        headers: {"Content-type": "application/json"});
    dynamic userData=jsonDecode(response.body);
    return UserData.fromJson(userData);
  }
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
        title: Text("Sample"),
      ),
      body:
      FutureBuilder(
        future: getOneData(),
        builder: (context,snapshot){
          if(snapshot.hasData){
//            List<UserData> lt=snapshot.data;
            UserData lt=snapshot.data;
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
                        itemBuilder:(context,index){
                          return Container(
                            child: Card(
                              color: Colors.grey,
                              child: Center(child: Text("${lt.userId}\n${lt.title}\nthis page number is ${lt.id}",style: TextStyle(fontSize: 20))),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 100,),
                  Container(
                    child: Text("Page Bottom Content",style: TextStyle(fontSize: 30,),),
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