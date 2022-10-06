import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class ExitDialogBox extends StatefulWidget {
  final String title, descriptions, text;

  const ExitDialogBox(
      {required this.title, required this.descriptions, required this.text});

  @override
  _ExitDialogBoxState createState() => _ExitDialogBoxState();
}

class _ExitDialogBoxState extends State<ExitDialogBox> {
  static const double constantsPadding = 20;
  static const double constantsAvatarRadius = 45;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(constantsPadding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(
              left: constantsPadding,
              top: constantsAvatarRadius + constantsPadding,
              right: constantsPadding,
              bottom: constantsPadding),
          margin: EdgeInsets.only(
              top: constantsAvatarRadius, left: 0.h, right: 0.h),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(constantsPadding),
              boxShadow: const []),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.descriptions,
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 22,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff45152A), // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                    child: Text(
                      widget.text,
                      style: const TextStyle(fontFamily: "RobotoBold"),
                    )),
              ),
            ],
          ),
        ),
        Positioned(
          left: constantsPadding,
          right: constantsPadding,
          child: CircleAvatar(
            backgroundColor: const Color(0xff45152A),
            radius: constantsAvatarRadius,
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(0)),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: Image.asset(
                    "images/logo.png",
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
