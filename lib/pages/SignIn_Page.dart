import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:todolist/pages/todo_list.dart';
import 'package:todolist/services/Api_Manager.dart';
import 'package:todolist/utils/Constant.dart';
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

  bool _isVisible = false;
  bool _isConVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

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

  _showError() {
    setState(() {
      _isVisible = true;
    });
  }

  _showConnectionError() {
    setState(() {
      _isConVisible = true;
    });
  }

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
                            //autovalidateMode: AutovalidateMode.always,
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  child: TextFormField(
                                    controller: emailController,
                                    // onChanged: (value) {
                                    //   emailController.text = value;
                                    // },
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
                                    // onChanged: (value) {
                                    //   passController.text = value;
                                    // },
                                    decoration: InputDecoration(
                                        hintStyle: Constant.inputBoxTextStyle,
                                        fillColor: Colors.white70,
                                        hintText: "Enter your password",
                                        labelText: "Password",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        suffixIcon: Icon(
                                          Icons.visibility,
                                          color: AppColors.boxgColor,
                                        )),
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
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Visibility(
                            visible: _isVisible,
                            child: MidText(
                                text: "Invalid Credentials -> ",
                                color: Colors.red,
                                size: 14),
                          ),
                          Visibility(
                            visible: _isConVisible,
                            child: MidText(
                                text: "Please Check Your Connection... ",
                                color: Colors.red,
                                size: 14),
                          ),
                          MidText(
                              text: "Forgot Password",
                              color: AppColors.boxgColor,
                              size: 14),
                        ],
                      ))),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: InkWell(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          // emailController.text

                          var msg = await _SignIn(context);
                          //print(msg);
                          if (msg == true) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TodoList()),
                              (Route<dynamic> route) => false,
                            );
                          } else if (msg == false) {
                            _showError();
                          }
                        }
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
                                text: "Sign Up",
                                color: AppColors.boxgColor,
                                size: 14),
                          )
                        ],
                      ))),
                ])),
          ],
        ));
  }

  _SignIn(BuildContext context) async {
    try {
      if (emailController.text.isNotEmpty && passController.text.isNotEmpty) {
        var data = {
          'email': emailController.text,
          'password': passController.text
        };
        var res = await API_Manager().login(data, 'login');
        var body = jsonDecode(res.body);
        print(res.statusCode);
        print(body);
        print(body['message']);
        if (body['message'] == 'LOGIN') {
          return true;
        } else if (body['message'] == 'INVALID') {
          return false;
        }
      }
    } catch (e) {
      //_showConnectionError();
    }
  }
}
