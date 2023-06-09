import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_api_integration_flutter_project/screens/get_users_list.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("API")),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  registerUser();
                },
                child: const Text("Register User")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (builder) => const GetUsersList()));
                },
                child: const Text("Get Users")),


                ElevatedButton(
                onPressed: () {
                  UpdateUser();
                },
                child: const Text("Update")),


              ElevatedButton(
                onPressed: () {
                 deletteUser();
                },
                child: const Text("Delete"))




          ],
        )));
  }

  registerUser() async {
    String postApi = "https://reqres.in/api/users";
    Map map = {"name": "morpheus", "job": "leader"};
    http.Response response = await http.post(Uri.parse(postApi), body: map);
    print("Response ${response.body}");
    print("Response ${response.statusCode.toString()}");
  }


  
  UpdateUser() async {
    String postApi = "https://reqres.in/api/users";
    Map<String, String> map = {"name": "morpheus", "job": "developer"};
    http.Response response = await http.put(Uri.parse(postApi), body: map);
    print("Response ${response.body}");
    print("Response ${response.statusCode.toString()}");
  }

  deletteUser() async {
    String postApi = "https://reqres.in/api/users";
    Map<String, String> map = {"name": "morpheus", "job": "leader"};
    http.Response response = await http.delete(Uri.parse(postApi), body: map);
    print("Response ${response.body}");
    print("Response ${response.statusCode.toString()}");
  }





}
