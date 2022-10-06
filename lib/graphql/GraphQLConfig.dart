import "package:flutter/material.dart";
import "package:graphql_flutter/graphql_flutter.dart";

class GraphQLConfiguration {

  static const String _host = '161.97.151.134:8070';

  static String getHost() {
    return "http://$_host";
  }

  static HttpLink httpLink = HttpLink(
    "http://$_host/graphql",
  );

  static AuthLink authLink = AuthLink(
    getToken: () async =>
        'Bearer f2ea3dcb9a523172e269a2be160cb1959e3752d45c3a3055a64cb6601d2902541e4508f425bfff2cff8ff1ee5e24366fbb041eddc965400f21093e3f8c0f7d1601fc79965036c49b1d13f1644e41ff69ded9b95b129223acba11918cdfb25254a07cb807be8dd164a11a11c6c4132a1bc6114951b18ab651351fe52b7172c37d',
  );

  static WebSocketLink websocketLink = WebSocketLink(
    "wss://$_host/graphql",
    config: const SocketClientConfig(
      autoReconnect: true,
      inactivityTimeout: Duration(seconds: 30),
    ),
  );


  static Link link = authLink.concat(httpLink);

  static ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: GraphQLCache(),
      link: link,
    ),
  );

  static ValueNotifier<GraphQLClient> clientToQuery() {
    return client;
  }
}
