import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/utils/colors.dart';
import 'package:todolist/widgets/Text_Field.dart';

import '../utils/Constant.dart';
import '../widgets/Big_Text.dart';
import '../widgets/Main_Button.dart';
import '../widgets/Mid_Text.dart';
import 'SignIn_Page.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                    child: BigText(text: "Welcome Onboard!"),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Center(
                        child: MidText(
                            text: "Let's help you meet up your tasks",
                            size: 15),
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 50),
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
                                      hintStyle: Constant.inputBoxTextStyle,
                                      fillColor: Colors.white70,
                                      hintText: "Enter your Name",
                                      labelText: "Name",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter name';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                    top: 20,
                                  ),
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      hintStyle: Constant.inputBoxTextStyle,
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
                                      hintStyle: Constant.inputBoxTextStyle,
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
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 20, left: 20, right: 20),
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      hintStyle: Constant.inputBoxTextStyle,
                                      fillColor: Colors.white70,
                                      hintText: "Confirm password",
                                      labelText: "Confirm Password",
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
                    margin: EdgeInsets.only(top: 30),
                    child: InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                      child: MainButton(text: "Sign Up"),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MidText(text: "Already have an account ? ", size: 14),
                          InkWell(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInPage()),
                                (Route<dynamic> route) => false,
                              );
                            },
                            child: MidText(
                                text: "Sign In",
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
