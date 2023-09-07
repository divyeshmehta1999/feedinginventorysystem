import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'HomePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      Get.offAll(HomePage());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff757EFA),
        body: Column(
          children: [
            Center(
                child: Text(
              'Feeding Hope\nOne Paw At a Time',
              style: TextStyle(color: Colors.white),
            )),
            Icon(
              Icons.pets_rounded,
              color: Colors.white,
              size: 100,
            ),
            Container(
                height: 600,
                width: 500,
                child: Image.asset(
                  'assets/berner-sennenhund-puppy-yellow 1.png',
                  fit: BoxFit.cover,
                ))
          ],
        ),
      ),
    );
  }
}
