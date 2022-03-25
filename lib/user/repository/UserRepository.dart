
import 'package:get/get.dart';
import 'package:graphql_users_admin/user/data/UserServiceGraphql.dart';

import '../model/User.dart';

class UserRepository{
  
  final UserServiceGraphql _userServiceGraphql =  
    Get.find<UserServiceGraphql>();

  Future<int?> insertUser(UserRx user) async {
    print("User in service $user.toString()");
    return await _userServiceGraphql.insertUser(user);
  }

  Future<List<UserRx>?> getAllUsers()async{
    return await _userServiceGraphql.getAllUsers();
  }

  Future<int?> removeUser(int id)async{
    return await  _userServiceGraphql.removeUser(id);
  }

  Future<int?> updateUser(UserRx user) async{
    return await _userServiceGraphql.updateUser(user);
  }

}