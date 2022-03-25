class QuerysUser {


  static String lisAllUsers = r'''
      query MyQuery {
        users {
          user_email
          user_id
          user_name
          user_phone
          user_photo
        }
      }
''';

static String getUser = r''' 
query getUser ($username: String){
  users(where: {user_name:{_eq: $username}}){
    user_email
    user_id
    user_name
    user_phone
    user_photo
  }
} ''';
}
