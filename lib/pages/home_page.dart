import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sga/assistance/assistance_page.dart';
import 'package:sga/pages/course/course_page.dart';
import 'package:sizer/sizer.dart';

import '../tools/exit_dialog_box.dart';

class HomePage extends StatefulWidget {
  String email;

  HomePage({required this.email});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 1;
  final PageController _pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      systemStatusBarContrastEnforced: false,
    ));
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
      child: Scaffold(

        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: [
           CoursePage(email:widget.email),
            AssistancePage(email: widget.email),
            Container(color: Colors.brown),
          ],
          onPageChanged: (index) {
            setState(() => _currentPage = index);
          },
        ),
        bottomNavigationBar: BottomBar(
          duration: const Duration(milliseconds: 300),
          backgroundColor: Colors.white,
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          selectedIndex: _currentPage,
          onTap: (int index) {
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 100),
                curve: Curves.linear);
            setState(() => _currentPage = index);
          },
          items: const [
            BottomBarItem(
                icon: Icon(Icons.school),
                backgroundColorOpacity: 1,
                activeTitleColor: Colors.white,
                title: Text("Mi Curso"),
                activeColor: Color(0xff4c142c),
                activeIconColor: Colors.white),
            BottomBarItem(
                icon: Icon(Icons.assignment_outlined),
                backgroundColorOpacity: 1,
                activeTitleColor: Colors.white,
                title: Text("Mis Asistencias"),
                activeColor: Color(0xff4c142c),
                activeIconColor: Colors.white),
            BottomBarItem(
                icon: Icon(Icons.person),
                backgroundColorOpacity: 1,
                activeTitleColor: Colors.white,
                title: Text("Mi Perfil"),
                activeColor: Color(0xff4c142c),
                activeIconColor: Colors.white),
          ],
        ),
      ),
    );
  }
}
