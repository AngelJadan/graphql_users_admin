import 'package:hasura_connect/hasura_connect.dart';

class GraphqlConfig{


  static String server = "http://172.21.128.1:8080/v1/graphql";
  static String socket = "";

  HasuraConnect clientToQuery(){    
    print("Connecting");
    return HasuraConnect(server, headers:{
      'content-type': 'application/json',
    });
  }

}