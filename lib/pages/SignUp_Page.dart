import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/pages/todo_list.dart';
import 'package:todolist/utils/colors.dart';
import 'package:todolist/widgets/Text_Field.dart';

import '../services/Api_Manager.dart';
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

TextEditingController emailController = TextEditingController();
TextEditingController passController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController pass2Controller = TextEditingController();

String? validateEmail(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value))
    return 'Enter a valid email address';
  else
    return null;
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
                                    controller: nameController,
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
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      hintStyle: Constant.inputBoxTextStyle,
                                      fillColor: Colors.white70,
                                      hintText: "Enter your Email",
                                      labelText: "Email",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                    ),
                                    validator: (value) => validateEmail(value),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 20, left: 20, right: 20),
                                  child: TextFormField(
                                    obscureText: true,
                                    controller: passController,
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
                                      } else if (pass2Controller.value !=
                                          passController.value) {
                                        return 'Both passwords are not same';
                                      } else if (value.length < 8) {
                                        return 'Both Should be greater than 8 char';
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
                                    controller: pass2Controller,
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
                                      } else if (pass2Controller.value !=
                                          passController.value) {
                                        return 'Both passwords are not same';
                                      } else if (value.length < 8) {
                                        return 'Both Should be greater than 8 char';
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
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          // emailController.text

                          var msg = await _SignUp(context);
                          //print(msg);
                          if (msg == true) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TodoList()),
                              (Route<dynamic> route) => false,
                            );
                          }
                          // else if (msg == false) {
                          //   _showError();
                          // }
                        }
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

  _SignUp(BuildContext context) async {
    try {
      if (emailController.text.isNotEmpty &&
          passController.text.isNotEmpty &&
          pass2Controller.text.isNotEmpty &&
          nameController.text.isNotEmpty &&
          pass2Controller.text == passController.text) {
        var data = {
          'name': nameController.text,
          'email': emailController.text,
          'password': passController.text
        };
        var res = await API_Manager().login(data, 'register');
        var body = jsonDecode(res.body);
        print(res.statusCode);
        print(body);
        print(body['message']);
        if (body['message'] == 'SUCCESS') {
          return true;
        } else {
          return false;
        }
      }
    } catch (e) {
      //_showConnectionError();
    }
  }
}
