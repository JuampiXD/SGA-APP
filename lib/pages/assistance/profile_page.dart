import 'package:flutter/material.dart';
import 'package:sga/graphql/model/objetos.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatefulWidget {
  User usuario;

  ProfilePage({required this.usuario});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4.h),
      height: 28.h,
      width: 100.w,
      child: Row(
        children: [
          SizedBox(
            width: 40.w,
            child: Center(
              child: CircleAvatar(
                radius: 15.w,
                child: Icon(
                  Icons.person,
                  size: 20.w,
                ),
              ),
            ),
          ),
          Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.usuario.firstName} ${widget.usuario.lastNameF} ${widget.usuario.lastNameM} ",
                      textScaleFactor: 1.4,
                      style: const TextStyle(fontFamily: "RobotoBold"),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      widget.usuario.chapa + " - "+ widget.usuario.sangre+widget.usuario.factor,
                      style: const TextStyle(fontFamily: "RobotoMedium"),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      widget.usuario.email,
                      style: const TextStyle(fontFamily: "RobotoItalic"),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      widget.usuario.rol.substring(0, 1) +
                          widget.usuario.rol
                              .substring(1)
                              .toLowerCase()
                              .replaceAll("_", " "),
                      style: const TextStyle(fontFamily: "RobotoMedium"),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
