import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  SmallText(
      {Key? key,
      this.color = const Color.fromRGBO(0, 0, 0, 0.70),
      required this.text,
      this.size = 12,
      this.height = 1.2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontFamily: 'Poppins',
            color: color,
            fontSize: size,
            height: height));
  }
}
