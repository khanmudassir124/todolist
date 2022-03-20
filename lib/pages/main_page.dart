import 'package:flutter/material.dart';
import 'package:todolist/utils/colors.dart';
import 'package:flutter/services.dart';
import 'package:todolist/widgets/app_icon.dart';
import '../widgets/Big_Text.dart';
import '../widgets/small_text.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode([SystemUiOverlay.bottom]);
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
      endDrawer: Drawer(
        child: Column(
          children: [
            Container(
                height: 210,
                width: 320,
                color: AppColors.boxgColor,
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 42,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 40,
                              foregroundImage:
                                  AssetImage("assets/images/img.png"),
                              backgroundImage:
                                  AssetImage("assets/images/img.png"),
                            ),
                          ),
                          BigText(
                            text: "Sarfaraz Khan",
                            color: Colors.white,
                          ),
                          SmallText(
                            text: "admin@gmail.com",
                            color: Colors.white,
                          ),
                          // Container(
                          //   width: 40,
                          //   height: 40,
                          //   child: AppIcon(icon: Icons.abc, size: 20),
                          // )
                        ],
                      ),
                    ),
                  ],
                )
                // decoration: BoxDecoration(color: AppColors.boxgColor),
                ),
            Material(
              child: ListView(
                padding: EdgeInsets.only(top: 0),
                shrinkWrap: true,
                children: <Widget>[
                  // const SizedBox(
                  //   height: 40,
                  // ),
                  buildMenuItem(
                      text: "Something",
                      icon: Icons.people,
                      onClicked: () => selectedItem(context, 0)),
                  buildMenuItem(text: "Something", icon: Icons.people)
                ],
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
          backgroundColor: AppColors.boxgColor,
          title: Row(
            children: [
              CircleAvatar(
                radius: 21,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 20,
                  foregroundImage: AssetImage("assets/images/img.png"),
                  backgroundImage: AssetImage("assets/images/img.png"),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              SmallText(
                text: "Welcome, Sarfaraz Khan",
                color: Colors.white,
                size: 16,
              )
            ],
          )),
      body: Container(
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: SizedBox(
                    height: 150,
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
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              })),
    );
  }

  void selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        print("Button Pressed - 0");
        break;
    }
  }
}

Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  final color = AppColors.boxgColor;
  final hoverColor = Colors.white;
  return ListTile(
      leading: Icon(icon, color: color),
      title: SmallText(
        text: text,
        color: color,
        size: 15,
      ),
      hoverColor: hoverColor,
      onTap: () {});
}
