class MutationsUser {
  static String insertUser =
      r""" mutation inserUser($object: users_insert_input!) {
                                    insert_users_one(object: $object) {
                                      user_id
                                    }
                                  }
 """;

  static String removeUser = r"""mutation removeUser($id: Int) {
                                    delete_users(where: {user_id: {_eq: $id}}) {
                                      affected_rows
                                    }
                                  }
""";

static String updateUser = r"""mutation MyMutation($id: Int, $object: users_set_input) {
  update_users(where: {user_id: {_eq: $id}}, _set: $object) {
    affected_rows
  }
}

""";
}
