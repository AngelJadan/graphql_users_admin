import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_users_admin/user/model/User.dart';
import 'package:graphql_users_admin/user/ui/screens/AddUser.dart';
import 'package:graphql_users_admin/user/ui/widgets/DialogWidget.dart';

import '../../controller/UserController.dart';

class ItemUserWidget extends StatelessWidget {
  final UserRx user;

  ItemUserWidget({required this.user});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    return ListTile(
      leading: Icon(Icons.person),
      title: Text(user.username.toString()),
      trailing: Wrap(
        spacing: 15,
        children: [
          GestureDetector(
              child: CircleAvatar(
                child: Icon(
                  Icons.visibility,
                  color: Colors.blueAccent,
                ),
                backgroundColor: Colors.white,
              ),
              onTap: () {}),
          GestureDetector(
              child: CircleAvatar(
                child: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                backgroundColor: Colors.white,
              ),
              onTap: () {
                mostrarDialogDobleWidget(
                    context, "Esta seguro de eliminar el cliente",
                    fIzquierda: () {
                      userController.deleteUser(int.parse(user.id.toString()));
                    }, fBotonIDerecha: () {
                  Get.back();
                });
              }),
          GestureDetector(
              child: CircleAvatar(
                child: Icon(
                  Icons.edit,
                  color: Colors.blueAccent,
                ),
                backgroundColor: Colors.white,
              ),
              onTap: () {
                Get.to(AddUser(user: user, action: 2));
              })
        ],
      ),
    );
  }
}
