import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/utils/colors.dart';
import 'package:todolist/widgets/app_icon.dart';
import 'package:todolist/widgets/small_text.dart';

import '../widgets/Big_Text.dart';

class TodoList extends StatefulWidget {
  TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        //backgroundColor: AppColors.bgColor,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        height: 325,
        width: 450,
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(color: AppColors.boxgColor),
        child: Stack(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(height: 190, image: AssetImage("assets/images/shape1.png")),
            Center(
                child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 130),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 57,
                      foregroundImage: AssetImage("assets/images/img.png"),
                      backgroundImage: AssetImage("assets/images/img.png"),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 12),
                    child: BigText(
                        text: "Welcome, Sarfaraz Khan", color: Colors.white)),
                Container(
                    margin: EdgeInsets.only(top: 5),
                    child: SmallText(
                      text: "Good Afternoon",
                      color: Colors.white,
                      size: 15,
                    ))
              ],
            ))
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 12),
              child: BigText(text: "Tasks List"),
            ),
            Container(
              child: SizedBox(
                height: 300,
                width: 350,
                child: Container(
                  margin: EdgeInsets.only(top: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 209, 209, 209),
                        offset: const Offset(
                          0,
                          1,
                        ),
                        blurRadius: 25.0,
                        spreadRadius: 0.0,
                      ),
                      BoxShadow(
                        color: Color.fromARGB(255, 243, 243, 243),
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SmallText(
                              text: "Task List",
                              size: 16,
                            ),
                            Icon(
                              Icons.add_circle_outline_outlined,
                              color: AppColors.boxgColor,
                              size: 30,
                            )
                          ],
                        ),
                      ),
                      Container(
                        //margin: EdgeInsets.only(top: 10),
                        width: 300,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Icon(
                                      Icons.check_box_outlined,
                                      color: AppColors.boxgColor,
                                      size: 30,
                                    ),
                                  ),
                                  SmallText(
                                    text: "Learn React JS at 12 PM",
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Icon(
                                      Icons.check_box_outlined,
                                      color: AppColors.boxgColor,
                                      size: 30,
                                    ),
                                  ),
                                  SmallText(
                                    text: "Learn React JS at 12 PM",
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Icon(
                                      Icons.check_box_outlined,
                                      color: AppColors.boxgColor,
                                      size: 30,
                                    ),
                                  ),
                                  SmallText(
                                    text: "Learn React JS at 12 PM",
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Icon(
                                      Icons.check_box_outlined,
                                      color: AppColors.boxgColor,
                                      size: 30,
                                    ),
                                  ),
                                  SmallText(
                                    text: "Learn React JS at 12 PM",
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Icon(
                                      Icons.check_box_outlined,
                                      color: AppColors.boxgColor,
                                      size: 30,
                                    ),
                                  ),
                                  SmallText(
                                    text: "Learn React JS at 12 PM",
                                    size: 16,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )
    ]));
  }
}
