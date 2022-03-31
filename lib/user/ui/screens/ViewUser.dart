

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_users_admin/user/model/User.dart';

class ViewUser extends StatelessWidget {

  UserRx userRx = UserRx();

  ViewUser({required this.userRx});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User"),
      ),
      body:SingleChildScrollView(
        padding: EdgeInsets.all(12.0),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                children: [
                  Text("Username: ", style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(userRx.username.toString()),
                ]
              ),
              Row(
                children: [
                  Text("Email: ", style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(userRx.email.toString()),
                ]
              ),
              Row(
                children: [
                  Text("Phone: ", style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(userRx.phone.toString()),
                ]
              ),
              Row(
                children: [
                  Text("Image: ", style: const TextStyle(fontWeight: FontWeight.bold)),
                ]
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: FadeInImage(
                  placeholder: AssetImage(userRx.photo.toString()),//AssetImage(ship.url),
                  image: NetworkImage(userRx.photo.toString()),
                  width: 250,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )
      )
    );
  }
}