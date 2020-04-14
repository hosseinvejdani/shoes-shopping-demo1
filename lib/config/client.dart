import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../env.dart';

class Config {
  //static final Link link = authLink.concat(httpLink);
  static ValueNotifier<GraphQLClient> initailizeClient() {
    final HttpLink httpLink = HttpLink(
      uri: Env.GraphqlEndpointURL,
    );
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: InMemoryCache(),
        link: httpLink,
      ),
    );
    return client;
  }
}
