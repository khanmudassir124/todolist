import 'package:flutter/cupertino.dart';

class MidText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  MidText(
      {Key? key,
      this.color = const Color.fromRGBO(0, 0, 0, 0.70),
      required this.text,
      this.size = 12,
      this.height = 1.4})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: 'Poppins',
            color: color,
            fontSize: size,
            height: height,
            letterSpacing: 0.7));
  }
}
