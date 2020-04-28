import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../env.dart';

// class Config {
//   //static final Link link = authLink.concat(httpLink);
//   static ValueNotifier<GraphQLClient> initailizeClient() {

//     final HttpLink httpLink = HttpLink(
//       uri: Env.graphqlEndpointURL,
//     );

//     ValueNotifier<GraphQLClient> client = ValueNotifier(

//       GraphQLClient(
//         cache: InMemoryCache(),
//         link: httpLink,
//       ),

//     );
//     return client;
//   }
// }



class Config{

  static final HttpLink link = HttpLink(
    headers: <String, String>{
      'Authorization': 'JWT ${Env.jwtToken}',
      'Content-Type' : 'application/json'
    },
    uri: Env.graphqlEndpointURL,
  );


  static ValueNotifier<GraphQLClient> initailizeClient() {
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: InMemoryCache(),
        link: link,
      ),
    );
    return client;
  }
}
