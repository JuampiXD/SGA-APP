import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sga/pages/home_page.dart';
import 'package:sga/pages/register_page.dart';
import 'package:sga/pages/splash_page.dart';
import 'package:sizer/sizer.dart';

import 'graphql/GraphQLConfig.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
    systemStatusBarContrastEnforced: false,
  ));
  runApp(
    const MyApp(),
  );
}

 //  Color Arena  FEF8E6
//  Color Arena Oscuro  DFD2C6
//  Color Vino  45152A

//
// #916871
// #a48484
// #a37c84
// #fcfbe4
// #4c142c
// #ba9d9a
// #d2bcb4
// #decbbf
// #d4c4bc
// #a4848c
// #744252
// #ccb4b4
// #5c2437
// #6c394c
// #eadccc
// #a47c7c
// #673444
// #ece2d4
// #642c40
// #744c54
// #f5ecda
// #f4e4d4
// #fcf4dc



class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "SGA",
        scrollBehavior: const ScrollBehavior().copyWith(
            physics: const BouncingScrollPhysics(),
            scrollbars: false,
            overscroll: false),
        theme: ThemeData(
          fontFamily: 'RobotoRegular',
        ),
        debugShowCheckedModeBanner: false,
        home: Sizer(builder: (context, orientation, deviceType) {

          return GraphQLProvider(
              client: GraphQLConfiguration.clientToQuery(),
              child:
               RegisterPage()

          );
        }));
  }
}