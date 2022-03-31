import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:graphql_users_admin/user/model/User.dart';

import '../../controller/UserController.dart';

class AddUser extends StatelessWidget {
  UserRx user = UserRx();
  
  int action;

  AddUser({required this.user, required this.action});

  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("New user"),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(12.0),
          scrollDirection: Axis.vertical,
          child: Form(
            key: userController.formKeyUser,
            child: Column(children: [
              TextFormField(
                initialValue: action == 1 ? '' : user.username?.value,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "User name",
                    icon: const Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: const Icon(Icons.person),
                    )),
                onChanged: (newUsername) => user.username = RxString(newUsername),
                onSaved: (newUsername) => user.username = RxString(newUsername!),
                validator: (value) {
                  print("value $value");

                  if (value == null || value.isEmpty) {
                    return 'The username is empty';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: action == 1 ? '' : user.email?.value,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "User email",
                    icon: const Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: const Icon(Icons.email),
                    )),
                onChanged: (newEmail) => user.email = RxString(newEmail),
                onSaved: (newEmail) => user.email = RxString(newEmail!),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'The email is empty';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: action == 1 ? '' : user.phone?.value,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "User phone",
                    icon: const Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: const Icon(Icons.phone),
                    )),
                onChanged: (newPhone) => user.phone = RxString(newPhone),
                onSaved: (newPhone) => user.phone = RxString(newPhone!),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'The number phone is empty';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: action == 1 ? '' : user.photo?.value,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "User url photo",
                    icon: const Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: const Icon(Icons.photo),
                    )),
                onChanged: (newPhoto) => user.photo = RxString(newPhoto),
                onSaved: (newPhoto) => user.photo = RxString(newPhoto!),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'The photo is empty';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: action == 1 ? '' : user.password?.value,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "User password",
                    icon: const Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: const Icon(Icons.key),
                    )),
                onChanged: (newPassword) => user.password = RxString(newPassword),
                onSaved: (newPassword) => user.password = RxString(newPassword!),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'The password is empty';
                  }
                  return null;
                },
                obscureText: true,
              ),
            ]),
          )),
      floatingActionButton: FloatingActionButton(
        heroTag: "AddEditUser",
        child: Icon(Icons.check),
        onPressed: () async {
          if (userController.formKeyUser.currentState!.validate()) {
            userController.formKeyUser.currentState!.save();
            if (action == 1) {
              print("User in addUser");
              print(user.username);
              await userController.addUser(user);
              
            } else {
              user.id.obs.value = this.user.id;
              await userController.updateUser(user);
            }
          }
        },
      ),
    );
  }
}
