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
    //update();
  }

  addUser(UserRx user) async {
    try {
      user.username.obs.value = user.username;
    user.email.obs.value = user.email;
    user.phone.obs.value = user.phone;
    user.photo.obs.value = user.photo;
    user.password.obs.value = user.password;

    print("User to String: $user");

    print("user to Json: $user");
    var res = await _userRepository.insertUser(user);
    print("res $res");
    if ((res)! > 0) {
      user.id = RxInt(res);
      print('user id $user.id');
      this.users.add(user);

      print("User last add. $user.toString()");


      update();
      Get.back();
      mostrarDialogSimpleWidget(Get.context!, "User added.");
      
    } else {
      mostrarDialogSimpleWidget(Get.context!, "Could't add user.");
    }
    } catch (e) {
      print("Error en user controller add $e");
    }
  }

  deleteUser(int id) async {
    print("Id recibido para eliminara $id");
    try {
      if ((await _userRepository.removeUser(id))! > 0) {
        this.users.removeWhere((element) => element.id == id);
        Get.back();
        mostrarDialogSimpleWidget(Get.context!, "Eliminado con exito");
        update();
      } else {
        mostrarDialogSimpleWidget(Get.context!, "Vuelve a intentar mas tarde");
      }
    } catch (e) {
      print("Se ha generado un error en deleteUser $e");
    }
  }

  updateUser(UserRx user) async {
    try {
      print("Into in user updted controller $user.toString()");
      if (user.id != null) {
        if ((await _userRepository.updateUser(user))! > 0) {
          this.users.forEach((element) {
            if (element.id == user.id) {
              element = user;
            }
          });
          init();
          update();
          Get.back();
          mostrarDialogSimpleWidget(Get.context!, "Successfull updated user.");
        } else {
          mostrarDialogSimpleWidget(
              Get.context!, "Couldn't update user try again.");
        }
      }else{
        print("Se recibio un id null");
      }
    } catch (e) {
      print("Error en updateUser $e");
    }
  }
}
