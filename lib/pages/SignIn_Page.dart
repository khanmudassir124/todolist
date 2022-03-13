import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/utils/colors.dart';
import 'package:todolist/widgets/Text_Field.dart';

import '../widgets/Big_Text.dart';
import '../widgets/Main_Button.dart';
import '../widgets/Mid_Text.dart';
import 'SignUp_Page.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        //backgroundColor: AppColors.bgColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(height: 190, image: AssetImage("assets/images/shape1.png")),
            Center(
                child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: BigText(text: "Welcome Back!"),
                  ),
                  Container(
                    height: 180,
                    width: 180,
                    margin: EdgeInsets.only(top: 20),
                    child: Image(
                      fit: BoxFit.contain,
                      image: AssetImage("assets/images/page2.png"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 0.70),
                                          fontFamily: 'Poppins',
                                          fontSize: 12),
                                      fillColor: Colors.white70,
                                      hintText: "Enter your Email",
                                      labelText: "Email",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter email';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 20, left: 20, right: 20),
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 0.70),
                                          fontFamily: 'Poppins',
                                          fontSize: 12),
                                      fillColor: Colors.white70,
                                      hintText: "Enter your password",
                                      labelText: "Password",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter password';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Center(
                        child: MidText(
                            text: "Forgot Password",
                            color: AppColors.boxgColor,
                            size: 14),
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                      child: MainButton(text: "Sign In"),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MidText(text: "Don't have an account ? ", size: 14),
                          InkWell(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()),
                                    (Route<dynamic> route) => false,
                              );
                            },
                            child: MidText(
                                text: "Sign Un",
                                color: AppColors.boxgColor,
                                size: 14),
                          )
                        ],
                      ))),
                ])),
          ],
        ));
  }
}
