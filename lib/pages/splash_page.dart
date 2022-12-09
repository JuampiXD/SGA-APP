import 'dart:async';
import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sga/pages/register_page.dart';
import 'package:sga/pages/version_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import '../graphql/GraphQLConfig.dart';
import '../graphql/model/objetos.dart';
import '../tools/fail_connection.dart';
import 'home_page.dart';

int versionLocal = 2;
int versionActual = 1;
late Future<int> futureVersion;
Widget siguiente = Container();

Future<int> fetchVersion() async {
  final response = await http
      .get(Uri.parse('${GraphQLConfiguration.getHost()}/api/version'));

  int versionServidor =
      jsonDecode(response.body)["data"]["attributes"]["version"];

  if (response.statusCode == 200) {
    versionActual = versionServidor;
    return versionServidor;
  } else {
    throw Exception('Fallo al optener la version');
  }
}

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<User> _user;

  @override
  void initState() {
    _user = _prefs.then((SharedPreferences prefs) {
      return User(
        prefs.getString('firstName') ?? "No",
        prefs.getString('lastNameF') ?? "No",
        prefs.getString('lastNameM') ?? "No",
        prefs.getString('password') ?? "No",
        prefs.getString('email') ?? "No",
        prefs.getString('rol') ?? "No",
        prefs.getString('alergias') ?? "No",
        prefs.getString('tipodeSangre') ?? "No",
        prefs.getString('factorRh') ?? "No",
        prefs.getString('chapadeGuerra') ?? "No",
        prefs.getString('compania') ?? "No",
        prefs.getString('seccion') ?? "No",
        prefs.getString('numPatrulla') ?? "No",
      );
    });

    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.bottomToTop,
                alignment: Alignment.center,
                duration: Duration(
                    milliseconds: versionLocal < versionActual ? 800 : 500),
                child: GraphQLProvider(
                  client: GraphQLConfiguration.clientToQuery(),
                  child: siguiente,
                ))));
    futureVersion = fetchVersion();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<int>(
        future: futureVersion,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (versionLocal < snapshot.data!) {
              siguiente = VersionPage(versionLocal, snapshot.data!);
            } else {
              siguiente = FutureBuilder<User>(
                future: _user,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data?.email == "No") {
                      return RegisterPage();
                    } else {
                      return HomePage(
                        usuario: snapshot.data!,
                      );
                    }
                  } else {
                    return const Fail_Connection(
                      descriptions: "No se puedo conectar con el Servidor",
                    );
                  }
                },
              );
            }
          } else if (snapshot.hasError) {
            siguiente = const Fail_Connection(
              descriptions: "No se puedo conectar con el Servidor",
            );
          }
          return Scaffold(
              backgroundColor: const Color(0xffFEF8E6),
              body: Center(
                child: FadeInDownBig(
                  child: SizedBox(
                    width: 100.w,
                    child: Image.asset(
                      "images/app.png",
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
