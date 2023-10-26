import 'package:flutter/material.dart';
import 'package:for_u/view/bottomAppBar.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              "assets/images/splash3.png",
              fit: BoxFit.cover,
              height: double.infinity,
            ),
            Positioned(
              bottom: 40,
              child: ElevatedButton(
                onPressed: () {
                  Get.off(() => const Bottomappbar());
                },
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                        Size.fromWidth(MediaQuery.of(context).size.width - 50)),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xff111111)),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 7)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)))),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("  "),
                    Text(
                      "Get Started",
                      style: TextStyle(
                          fontFamily: "myfont",
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    Icon(
                      Icons.arrow_circle_right_outlined,
                      size: 45,
                      color: Color(0xffffa500),
                    )
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
