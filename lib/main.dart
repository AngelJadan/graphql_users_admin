import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_users_admin/user/model/User.dart';
import 'package:graphql_users_admin/user/ui/screens/AddUser.dart';
import 'package:graphql_users_admin/user/ui/screens/ViewUser.dart';
import 'package:graphql_users_admin/util/Injection.dart';
import 'user/ui/pages/home.dart';

void main() {
  runApp(const MyApp());

  /*
  runApp(
    GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: ()=> Home()),
        GetPage(name: '/addUser', page: ()=> AddUser(
          user: User(),
          action: 1
        )),
      ],
    ),
  );*/
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Injection.init();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Users Admin',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: Home(),
      getPages: [
        GetPage(
          name: '/addUser', page: ()=> AddUser(
          user: UserRx(),
          action: 1
        )),
        GetPage(
          name: '/viewUser', page: ()=> ViewUser(
            userRx: UserRx(),
          )
        ),
      ],
    );
  }
}
