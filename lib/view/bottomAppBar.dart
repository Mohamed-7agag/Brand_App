// ignore_for_file: file_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:for_u/controller/controller.dart';
import 'package:for_u/view/cartscreen.dart';
import 'package:for_u/view/favorite.dart';
import 'package:for_u/view/mainhomepage.dart';
import 'package:for_u/view/userscreen.dart';
import 'package:get/get.dart';

class Bottomappbar extends StatefulWidget {
  const Bottomappbar({super.key});

  @override
  State<Bottomappbar> createState() => _BottomappbarState();
}

class _BottomappbarState extends State<Bottomappbar> {
  Cart controller = Get.put(Cart());
  List<Widget> screen = [
    const Homepage(),
    const FavoriteScreen(),
    const CartScreen(),
    const UserScreen(),
  ];

  _onbackButtonPressed(BuildContext context) async {
    bool? exitApp = await Get.defaultDialog(
      actions: [
        TextButton(
            style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all(const Color(0xffffa500))),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text("No")),
        TextButton(
            style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all(const Color(0xffffa500))),
            onPressed: () {
              SystemNavigator.pop();
            },
            child: const Text("Yes")),
      ],
      middleText: "Do You Want To Close The App??",
      title: "Really?",
      middleTextStyle: const TextStyle(fontSize: 12),
      titleStyle: const TextStyle(fontSize: 14),
      radius: 15,
      titlePadding: const EdgeInsets.symmetric(vertical: 15),
    );

    return exitApp ?? false;
  }

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () => _onbackButtonPressed(context),
      child: Scaffold(
          body: Obx(
        () => Stack(
          children: [
            screen.elementAt(controller.curIndex.value),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Align(
                alignment: const Alignment(0.0, 1.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: BottomNavigationBar(
                    selectedLabelStyle: const TextStyle(height: 1.5),
                    selectedFontSize: 11,
                    currentIndex: controller.curIndex.value,
                    selectedItemColor: const Color(0xffffa500),
                    onTap: (value) {
                      controller.curIndex.value = value;
                    },
                    items: [
                      BottomNavigationBarItem(
                          backgroundColor: const Color(0xff111111),
                          icon: controller.curIndex.value != 0
                              ? Image.asset(
                                  "assets/images/home.png",
                                  width: 20,
                                )
                              : Image.asset(
                                  "assets/images/home2.png",
                                  width: 20,
                                ),
                          label: "Home"),
                      BottomNavigationBarItem(
                          backgroundColor: const Color(0xff111111),
                          icon: controller.curIndex.value != 1
                              ? Image.asset(
                                  "assets/images/heart.png",
                                  width: 20,
                                )
                              : Image.asset(
                                  "assets/images/heart2.png",
                                  width: 20,
                                ),
                          label: "Favorite"),
                      BottomNavigationBarItem(
                          backgroundColor: const Color(0xff111111),
                          icon: controller.curIndex.value != 2
                              ? Image.asset(
                                  "assets/images/cart.png",
                                  width: 20,
                                )
                              : Image.asset(
                                  "assets/images/cart2.png",
                                  width: 20,
                                ),
                          label: "Cart"),
                      BottomNavigationBarItem(
                          backgroundColor: const Color(0xff111111),
                          icon: controller.curIndex.value != 3
                              ? Image.asset(
                                  "assets/images/user.png",
                                  width: 20,
                                )
                              : Image.asset(
                                  "assets/images/user2.png",
                                  width: 20,
                                ),
                          label: "Account"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
