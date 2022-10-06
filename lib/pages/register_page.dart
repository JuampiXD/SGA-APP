import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../tools/exit_dialog_box.dart';
import 'home_page.dart';

class RegisterPage extends StatelessWidget {
   RegisterPage({Key? key}) : super(key: key);
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      systemStatusBarContrastEnforced: false,
    ));

    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();


    void verificacion()async{

      final SharedPreferences prefs = await _prefs;
      await prefs.setString('email', emailController.text);

      Navigator.pushReplacement(
          context,
          PageTransition(
              type: PageTransitionType.bottomToTop,
              alignment: Alignment.center,
              duration: const Duration(milliseconds: 500),
              child:  HomePage(email: emailController.text)));

    }

    Widget formularioRegister() {
      return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
        return Form(
          key: formKey,
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: isKeyboardVisible ? 5.h : 15.h,
                  ),
                  SizedBox(
                    height: 45.w,
                    child: Image.asset(
                      "images/logo.png",
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.w, bottom: 0.h),
                    child: const Text(
                      "SGA",
                      textScaleFactor: 4.5,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff45152A),
                        fontFamily: "RobotoMedium",
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.w, bottom: 0.h),
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: const Text(
                      "Sistema de Gestion de Asistencias",
                      textScaleFactor: 1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff45152A),
                        fontFamily: "RobotoRegular",
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                    left: 3.h, right: 3.h, top: isKeyboardVisible ? 4.h : 12.h),
                child: TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    cursorColor: const Color(0xff45152A),
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff45152A)),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff45152A)),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff45152A)),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      hintText: 'Ingrese su correo institucional',
                      hintStyle: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "* Requerido"),
                      EmailValidator(errorText: "* Correo Invalido")
                    ])),
              ),
              Container(
                margin: EdgeInsets.only(left: 3.h, right: 3.h, top: 4.h),
                child: TextFormField(
                    textInputAction: TextInputAction.go,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    controller: passwordController,
                    cursorColor: const Color(0xff45152A),
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff45152A)),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff45152A)),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff45152A)),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      hintText: 'Ingrese su contraseña',
                      hintStyle: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "* Requerido"),
                    ])
                    //validatePassword,        //Function to check validation
                    ),
              ),
              Container(
                  height: 6.h,
                  margin: EdgeInsets.only(left: 12.h, right: 12.h, top: 4.h),
                  child: ElevatedButton(
                      autofocus: true,
                      onPressed: () {






                        if (formKey.currentState!.validate()) {



                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              backgroundColor: const Color(0xffFEF8E6),
                              title: const Text(
                                "Iniciando Sesion",
                                textAlign: TextAlign.center,
                                textScaleFactor: 1.2,
                                style: TextStyle(
                                    color: Color(0xff45152A),
                                    fontFamily: "RobotoBold"),
                              ),
                              actions: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 5.h),
                                  child: const Center(
                                    child: CircularProgressIndicator(
                                      color: Color(0xff45152A),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );


                          // Falta Verificacion

                        verificacion();

                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: const BorderSide(color: Color(0xff45152A))),
                        primary: const Color(0xff45152A), // background
                        onPrimary: const Color(0xff45152A),
                      ),
                      child: const Text(
                        "Iniciar Sesion",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "MontserratSemiBold",
                          color: Colors.white,
                        ),
                      )))
            ],
          ),
        );
      });
    }

    return WillPopScope(
        onWillPop: () async {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const ExitDialogBox(
                  text: 'Si, Salir',
                  descriptions: '¿Estás seguro de que deseas abandonar la app?',
                  title: 'Abandonar de la App',
                );
              });

          return false;
        },
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
              backgroundColor: Color(0xffFEF8E6),
              resizeToAvoidBottomInset: false,
              body: Stack(
                alignment: Alignment.center,
                children: [
                  // FadeInUp(
                  //   key: const ValueKey("Fondo"),
                  //   delay: const Duration(milliseconds: 500),
                  //   duration: const Duration(milliseconds: 1000),
                  //   child: ListView(
                  //     physics: const NeverScrollableScrollPhysics(),
                  //     children: [
                  //       Opacity(
                  //         opacity: 0.8,
                  //         child: Container(
                  //           margin: EdgeInsets.only(top: 10.h),
                  //           height: 100.h,
                  //           width: 100.w,
                  //           alignment: Alignment.bottomCenter,
                  //           child: Image.asset(
                  //             "images/logo.png",
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: 100.h,
                    width: 100.w,
                    child: formularioRegister(),
                  )
                ],
              )),
        ));
  }
}
