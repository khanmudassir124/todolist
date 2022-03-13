import 'package:flutter/material.dart';
import 'package:todolist/pages/SignUp_Page.dart';
import 'package:todolist/utils/colors.dart';
import 'package:todolist/widgets/Big_Text.dart';
import 'package:todolist/widgets/Main_Button.dart';
import 'package:todolist/widgets/small_text.dart';

import '../widgets/Mid_Text.dart';
import 'SignIn_Page.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                height: 200,
                width: 200,
                margin: EdgeInsets.only(top: 20),
                child: Image(
                  fit: BoxFit.contain,
                  image: AssetImage("assets/images/page1.png"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: BigText(text: "Get things Done with TODO"),
              ),
              Container(
                  width: 300,
                  height: 75,
                  margin: EdgeInsets.only(top: 30),
                  child: Center(
                    child: MidText(
                        text:
                            "This site is temporarily in read-only mode and not accepting new answers. Not the answer you're looking for? Browse other questions tagged dummy text."),
                  )),
              Container(
                margin: EdgeInsets.only(top: 100),
                child: InkWell(
                    child: MainButton(text: "Get Started"),
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => SignInPage()),
                        (Route<dynamic> route) => false,
                      );
                    }),
              )
            ])),
      ],
    ));
  }
}
