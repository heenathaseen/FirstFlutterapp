import 'dart:convert';
import 'package:http/http.dart';

import 'package:bassure/services/custom_http_response.dart';
import 'package:bassure/widgets/bassure_app_bar.dart';
import 'package:bassure/widgets/bassure_form_page.dart';
import 'package:bassure/widgets/bassure_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/entity.dart';
import 'package:bassure/services/form_page_service.dart';
import 'package:bassure/services/http_call.dart';

class bassureForm extends StatefulWidget {
  @override
  _bassureFormState createState() => _bassureFormState();
}

class _bassureFormState extends State<bassureForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<UserData> getOneUser() async {
    CustomHttpResponse response = await HttpCall()
        .objectGetCall("https://jsonplaceholder.typicode.com/comments/1");
    dynamic userData = jsonDecode(response.body);
    return UserData.fromJson(userData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BassureAppBar(
        // appBarLeading: IconButton(icon: Icon(Icon),),
        appbarTitle: Text('Using bassure'),
      ),
      body: FutureBuilder(
          future: getOneUser(),
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              UserData user = snapShot.data;
              nameController.text = user.name;

              emailController.text = user.email;


              return BassureFormPage(
                  formKey: _formKey,
                  body: (validateForm) {
                    return Container(
                      child: Column(
                        children: [
                          BassureTextFormField(
                            validate: (val) => FormPageService.validatePattern(
                                label: 'name',
                                patternType: 'alphabet',
                                val: val,
                                minLength: 5),
                            controller: nameController,
                            //decoration:BoxDecoration(),
                            inputDecoration: InputDecoration(
                              labelText: 'name',
                              hintText: 'Enter name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          BassureTextFormField(
                            controller: emailController,
                            validate: (val) => FormPageService.validatePattern(
                              label: 'email',
                              patternType: 'mail',
                              val: val,
                              minLength: 7,
                            ),
                            inputDecoration: InputDecoration(
                              labelText: 'email',
                              hintText: 'Enter Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (validateForm()) {
                                UserData ud = UserData(
                                  email: emailController.text,
                                  name: nameController.text,
                                );

                                CustomHttpResponse response = await HttpCall()
                                    .objectPostCall(
                                        "https://jsonplaceholder.typicode.com/comments",
                                        ud);
                                print(response.statusCode);
                                print(response.body);
                              }
                              ;
                            },
                            child: Text('submit'),
                          )
                        ],
                      ),
                    );
                  });
            } else if (snapShot.hasError) {
              return Text("getting error");
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
