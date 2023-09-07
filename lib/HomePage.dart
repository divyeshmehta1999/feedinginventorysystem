import 'package:anuaunty/Menu.dart';
import 'package:flutter/material.dart';

import 'utils.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: FractionallySizedBox(
        heightFactor: 1,
        widthFactor: 1,
        child: Column(
          children: [
            Text(
              "Menu",
              style: TextStyles.text,
            ),
            Menu()
          ],
        ),
      ),
    ));
  }
}
