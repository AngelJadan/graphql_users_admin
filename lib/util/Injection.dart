
import 'package:get/get.dart';
import 'package:graphql_users_admin/user/model/User.dart';
import '../user/controller/UserController.dart';
import '../user/data/UserServiceGraphql.dart';
import '../user/repository/UserRepository.dart';
import 'GraphqlConfig.dart';


class Injection{
  static void init(){
    
    Get.lazyPut(() => GraphqlConfig());

    Get.lazyPut(() => UserServiceGraphql());

    Get.lazyPut(() => UserRepository());

    Get.lazyPut(() => UserRx());
    Get.lazyPut(() => UserController());
  }
}