import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class VersionPage extends StatelessWidget {
  final int versionLocal;
  final int versionServidor;

  const VersionPage(this.versionLocal, this.versionServidor, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      systemStatusBarContrastEnforced: false,
    ));

    return Scaffold(
        backgroundColor: Color(0xffFEF8E6),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50.w,
                width: 50.w,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: Colors.brown,
                  child: Container(
                    padding:
                    EdgeInsets.symmetric(vertical: 6.h, horizontal: 10.w),
                    child: Image.asset(
                      "images/logo.png",
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Text(
                  "$versionLocal  --> $versionServidor",
                  textScaleFactor: 2.1,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: "RobotoSemiBold",
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                child: const Text(
                  "App desactualizada.",
                  textScaleFactor: 1.5,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "RobotoBold",
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 15.w),
                child: const Text(
                  "Para que puedas seguir usando APP SGA, y para que podamos ofrecerte la mejor experiencia posible, actualiza tu app.",
                  textScaleFactor: 0.95,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "RobotoRegular",
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff45152A),
                ),
                onPressed: () async {
                  // Uri url = Uri.parse(
                  //     "https://play.google.com/store/apps/details?id=com.emi.uasc.emi_uasc");
                  // launchUrl(
                  //   url,
                  //   mode: LaunchMode.externalNonBrowserApplication,
                  // );
                },
                label: const Text(
                  "Actualizar Ahora",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "RobotoRegular",
                  ),
                ),
                icon: const Icon(Icons.arrow_circle_down),
              )
            ],
          ),
        ));
  }
}
