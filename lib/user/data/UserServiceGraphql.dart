import 'dart:developer';

import 'package:get/get.dart';
import 'package:graphql_users_admin/user/graphql/Mutations.dart';
import 'package:graphql_users_admin/user/graphql/Querys.dart';
import 'package:graphql_users_admin/util/GraphqlConfig.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../model/User.dart';

class UserServiceGraphql {
  HasuraConnect _client = Get.find<GraphqlConfig>().clientToQuery();

  Future<int?> insertUser(UserRx user) async {
    try {
      var response =
          await _client.mutation(MutationsUser.insertUser, variables: {
        'object': user.toJsonGraphql(),
      });
      print(response);

      return response['data']['insert_users_one']["user_id"];
    } catch (e) {
      print("Error inserting $e");
    }
  }

  Future<List<UserRx>?> getAllUsers() async {
    List<UserRx> users = [];
    try {
      var result = await _client.query(QuerysUser.lisAllUsers);
      final List response = await result["data"]['users'];
      print("response all users");
      log("RESPONSE $response");

      for (int i = 0; i < response.length; i++) {
        users.add(UserRx.fromJson(response[i]));
      }
    } catch (e) {
      print("Error in getAllUsers $e");
    } finally {
      return users;
    }
  }

  Future<int?> removeUser(int id) async {
    try {
      var result = await _client
          .mutation(MutationsUser.removeUser, variables: {'id': id});
          print("result delete user $result");
      return result['data']['delete_users']["affected_rows"];
    } catch (e) {
      print("Error in user service graph remove $e");
    }
    return null;
  }

  Future<int?> updateUser(UserRx user) async {
    try {
      var result = await _client.mutation(MutationsUser.updateUser, variables:
      {'id':int.parse(user.id.toString()),
      "object":user.toJsonGraphql(),
      });
      print("Result $result");
      return result["data"]["update_users"]["affected_rows"];
    } catch (e) {
      print("Error in update user 'UserServiceGraphql.' $e");
    }
    return null;
  }

}
