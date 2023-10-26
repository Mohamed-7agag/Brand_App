import 'package:flutter/material.dart';
import 'package:for_u/model/localModel.dart';
import 'package:for_u/view/splash.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    getTshirt();
    getPantaloon();
    getShort();
    getJacket();
    getShirt();
    getShoes();
    getAllItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'For_U',
      home: SplashScreen(),
    );
  }
}
