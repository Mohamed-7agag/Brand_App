import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Later",
          style: TextStyle(
              fontFamily: 'myfont',
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.grey[500]),
        ),
      ),
    );
  }
}
