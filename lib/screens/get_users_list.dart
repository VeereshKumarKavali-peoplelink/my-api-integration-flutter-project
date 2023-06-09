
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_api_integration_flutter_project/screens/user_model.dart';


class GetUsersList extends StatefulWidget {
  const GetUsersList({super.key});

  @override
  State<GetUsersList> createState() => _GetUsersListState();
}

class _GetUsersListState extends State<GetUsersList> {
  get getData async {
    http.Response response = await http.get(Uri.parse("https://reqres.in/api/users"));
    print("Response ${response.body.toString()}");
    print("Response ${response.statusCode.toString()}");
    return response;

  }

  // @override
  // void initState(){
  //   getData();
  //   super.initState();
  // }

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My users")),
      body: FutureBuilder<http.Response>(future: getData, builder: ((context, snapshot){
        if (snapshot.hasData && snapshot.data != null){
          print("snapshot.data ${snapshot.data!.body.toString()}");
          Map map = jsonDecode(snapshot.data!.body.toString());
          print("snapshot.data ${map['data'].toString()}");

          List<UserModel> usersModelList = (map["data"] as List).map((e)=> UserModel.fromJson(e)).toList();

          //with out model
          // return ListView.builder(itemCount: map["data"].length ,itemBuilder: (context, index){
          //   return ListTile(title: Text(map["index"][index]["email"].toString()),
          //                   leading: Text(map["index"][index]["id"].toString())
          //   );
          // });

          //with model
          return ListView.builder(itemCount: usersModelList.length ,itemBuilder: (context, index){
            return ListTile(title: Text(usersModelList[index].email.toString()),
                            leading: Text(usersModelList[index].id.toString())
            );
          });
        

        }
        if (snapshot.hasError){
          return Center(child: Text(snapshot.error.toString()),);

        }
        return const  Center(child:  CircularProgressIndicator());
      }))

    );
  }
}