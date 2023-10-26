import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.grey[200],
                width: mq.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey[300],
                      child: Icon(
                        Icons.person_outline_rounded,
                        size: 60,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(
                      height: mq.height * 0.025,
                    ),
                    Text(
                      "Mohamed Hagag",
                      style: TextStyle(
                          fontFamily: 'myfont',
                          fontSize: mq.width * 0.055,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: mq.height * 0.015,
                    ),
                    Text(
                      "Beginner",
                      style: TextStyle(
                          fontFamily: 'myfont',
                          fontSize: mq.width * 0.04,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[500]),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(mq.width * 0.045),
                width: mq.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  children: [
                    SizedBox(
                      height: mq.height * 0.015,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.settings,
                              size: 30,
                              color: Colors.grey[700],
                            ),
                            SizedBox(
                              width: mq.width * 0.028,
                            ),
                            Text(
                              "Setting",
                              style: TextStyle(
                                  fontFamily: 'myfont',
                                  fontSize: mq.width * 0.044,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[700]),
                            )
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 23,
                          color: Colors.grey[700],
                        )
                      ],
                    ),
                    SizedBox(
                      height: mq.height * 0.038,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.payment,
                              size: 30,
                              color: Colors.grey[700],
                            ),
                            SizedBox(
                              width: mq.width * 0.028,
                            ),
                            Text(
                              "Payment",
                              style: TextStyle(
                                  fontFamily: 'myfont',
                                  fontSize: mq.width * 0.044,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[700]),
                            )
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 23,
                          color: Colors.grey[700],
                        )
                      ],
                    ),
                    SizedBox(
                      height: mq.height * 0.038,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.notifications_active_outlined,
                              size: 30,
                              color: Colors.grey[700],
                            ),
                            SizedBox(
                              width: mq.width * 0.028,
                            ),
                            Text(
                              "Notification",
                              style: TextStyle(
                                  fontFamily: 'myfont',
                                  fontSize: mq.width * 0.044,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[700]),
                            )
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 23,
                          color: Colors.grey[700],
                        )
                      ],
                    ),
                    SizedBox(
                      height: mq.height * 0.038,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.contact_support_outlined,
                              size: 30,
                              color: Colors.grey[700],
                            ),
                            SizedBox(
                              width: mq.width * 0.028,
                            ),
                            Text(
                              "Support",
                              style: TextStyle(
                                  fontFamily: 'myfont',
                                  fontSize: mq.width * 0.044,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[700]),
                            )
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 23,
                          color: Colors.grey[700],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
