import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'utils.dart';

class ChickenRice extends StatefulWidget {
  const ChickenRice({super.key});

  @override
  State<ChickenRice> createState() => _ChickenRiceState();
}

class _ChickenRiceState extends State<ChickenRice> {
  TextEditingController _orderId = TextEditingController();
  TextEditingController _orderWeight = TextEditingController();
  TextEditingController _contact = TextEditingController();
  TextEditingController _orderValue = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          {
            FirebaseFirestore.instance.collection('FoodMenu').add({
              'Ordered By': _orderId.text,
              'Order Weight': _orderWeight.text,
              'Order Value': _orderValue.text,
              'Order Contact': _contact.text,
            });
          }
        },
        icon: const Icon(IconData(0xe4a1, fontFamily: 'MaterialIcons')),
        label: const Text("Add Details"),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: FractionallySizedBox(
          heightFactor: 1,
          widthFactor: 1,
          child: Column(
            children: [
              const Text(
                "Order Id",
                style: TextStyles.text,
              ),
              TextFormField(
                controller: _orderId,
              ),
              const Text(
                "Order Weight",
                style: TextStyles.text,
              ),
              TextFormField(
                controller: _orderWeight,
              ),
              const Text(
                "Order Value",
                style: TextStyles.text,
              ),
              TextFormField(
                controller: _orderValue,
                keyboardType: const TextInputType.numberWithOptions(),
              ),
              const Text(
                "Order Contact",
                style: TextStyles.text,
              ),
              TextFormField(
                controller: _contact,
                keyboardType: const TextInputType.numberWithOptions(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
