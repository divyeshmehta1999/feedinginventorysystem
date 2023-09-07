import 'package:anuaunty/ChickenRice.dart';
import 'package:anuaunty/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => ChickenRice());
              },
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 50),
                    child: Container(
                      width: 156,
                      height: 212,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black.withOpacity(0.5)),
                      child: const Center(
                          child: Text(
                        "Rs: ",
                        style: TextStyles.text,
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 39.0, top: 5),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/chicken.jpg',
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 108.0, left: 20, right: 20),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 50),
                    child: Container(
                      width: 156,
                      height: 212,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black.withOpacity(0.5)),
                      child: const Center(
                          child: Text(
                        "Rs: ",
                        style: TextStyles.text,
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 39.0, top: 5),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/paneer.jpg',
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
