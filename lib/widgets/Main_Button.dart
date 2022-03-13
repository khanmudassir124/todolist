import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/utils/colors.dart';
import 'package:todolist/widgets/Big_Text.dart';

class MainButton extends StatelessWidget {
  final String text;
  Color? color;
  MainButton(
      {Key? key, required this.text, this.color = const Color(0xFF50C2C9)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: MainButton(text: "none");
    // );
    return Container(
        width: 324,
        height: 62,
        decoration: BoxDecoration(color: color),
        child: Center(
            child: Text(text,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600))));
  }
}
