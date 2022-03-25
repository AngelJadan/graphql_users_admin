

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_users_admin/user/controller/UserController.dart';
import 'package:graphql_users_admin/user/ui/widgets/ItemUserWidget.dart';

import '../widgets/CircularProgressWidget.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("List users"),
      ),
      body: GetBuilder<UserController>(
        init: UserController(),
        builder:(userController){
          if(userController.loadiong){
            return CircularProgressWidget();
          }else{
            return ListView.builder(
              itemCount: userController.users.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index){
                return ItemUserWidget(user: userController.users[index]);
              });
          }
        }),
      floatingActionButton:  FloatingActionButton(
        heroTag: "Add user",
        child: Icon(Icons.add),
        onPressed: (){
          Get.toNamed("/addUser");
        },
      ),
    );
  }
}