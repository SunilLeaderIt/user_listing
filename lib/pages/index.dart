import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:user_listing/model/userlist.dart';
import 'package:user_listing/themes/color.dart';
import 'package:http/http.dart' as http;

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List<Userlist>users = [];
  bool isLoading = false;
  @override
  void initState() {
    //fetchUser();
    getUsers();
    super.initState();
  }

   getUsers() async {
    final _data =
    await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    print(_data.body);

    try {
      final List<Userlist> dData = (const JsonDecoder().convert(_data.body) as List)
          .map((e) => Userlist.fromJson(e))
          .toList();

      return dData;
    } catch (e) {
      return Future.error(e);
    }
  }

  fetchUser() async {
    var url = "https://jsonplaceholder.typicode.com/users";
    var response = await http.get(Uri.parse(url));
     print(response.body);
    if(response.statusCode == 200){
      print("Entered Here");
      setState(() {

        var items = userListFromJson(json.decode(response.body));
        users.addAll(items);
        isLoading = false;
      });
      print(users.length);
    }else{
      users = [];
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    getUsers();
    return Scaffold(
      appBar: AppBar(
        title: Text("Users List"),
      ),
      body: getBody(),
    );
  }
  Widget getBody(){
    if(users.contains(null) || users.length < 0 || isLoading){
     return Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(primary),));
    }
    print(users.length);
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context,index){
      return getCard(users[index]);
    });
  }
  Widget getCard(item){
   var fullName = item['name'];
    var email = item['email'];
    return Card(
      elevation: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width-140,
                   child: Text(fullName,style: TextStyle(fontSize: 17),)),
                 SizedBox(height: 10,),
                  Text(email.toString(),style: TextStyle(color: Colors.grey),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}