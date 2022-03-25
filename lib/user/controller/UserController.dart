import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../model/User.dart';
import '../repository/UserRepository.dart';
import '../ui/widgets/DialogWidget.dart';

class UserController extends GetxController {
  List<UserRx> users = [];
  bool _loadiong = true;

  bool get loadiong => _loadiong;

  UserRepository _userRepository = Get.find<UserRepository>();
  UserRx userRx = UserRx();

  final formKeyUser = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    init();
  }

  init() async {
    this.users = (await _userRepository.getAllUsers())!;
    this._loadiong = false;
    update();
  }

  addUser(UserRx user) async {
    user.username.obs.value = user.username;
    user.email.obs.value = user.email;
    user.phone.obs.value = user.phone;
    user.photo.obs.value = user.photo;
    user.password.obs.value = user.password;

    print("User to String: $user");

    print("user to Json: $user");


    if ((await _userRepository.insertUser(user))! > 0) {
      this.users.add(user);
      update();
      Get.back();
      mostrarDialogSimpleWidget(Get.context!, "User added.");
    } else {
      mostrarDialogSimpleWidget(Get.context!, "Could't add user.");
    }
  }

  deleteUser(int id) async {
    if ((await _userRepository.removeUser(id))! > 0) {
      this
          .users
          .removeWhere((element) => element.id == id);
      update();
      Get.back();
      mostrarDialogSimpleWidget(Get.context!, "Eliminado con exito");
    } else {
      mostrarDialogSimpleWidget(Get.context!, "Vuelve a intentar mas tarde");
    }
  }

  updateUser(UserRx user) async {
    if((await _userRepository.updateUser(user))!>0){
      this.users.forEach((element) {
        if(element.id == user.id){
          element=user;
        }
      });
      Get.back();
      mostrarDialogSimpleWidget(Get.context!, "Successfull updated user.");
    }else{
      mostrarDialogSimpleWidget(Get.context!, "Couldn't update user try again.");
    }
  }

}
