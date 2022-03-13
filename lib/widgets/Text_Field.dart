import 'package:flutter/material.dart';
import 'package:todolist/widgets/small_text.dart';

class CustomTextField extends StatelessWidget {
  final String hhintText;
  final String labelText;
  CustomTextField({Key? key, required this.hhintText, required this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintStyle: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 0.70),
            fontFamily: 'Poppins',
            fontSize: 12),
        
        fillColor: Colors.white70,
        hintText: hhintText,
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
