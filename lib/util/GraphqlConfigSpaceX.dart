import 'package:hasura_connect/hasura_connect.dart';

class GraphqlConfigSpaceX{


  static String server = "https://api.spacex.land/graphql/";
  //static String socket = "";

  HasuraConnect clientToQuery(){    
    print("Connecting");
    return HasuraConnect(server, headers:{
      'content-type': 'application/json',
    });
  }

}