import 'package:anuaunty/PaneerOrderData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils.dart';

class PaneerRice extends StatefulWidget {
  const PaneerRice({super.key});

  @override
  State<PaneerRice> createState() => _PaneerRiceState();
}

class _PaneerRiceState extends State<PaneerRice> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _orderId = TextEditingController();
  TextEditingController _orderWeight = TextEditingController();
  TextEditingController _contact = TextEditingController();
  TextEditingController _orderValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // Form is valid, proceed with adding to Firestore
            Get.dialog(AlertDialog(
              title: Text('Order Details'),
              actions: [
                TextButton(
                  onPressed: () {
                    FirebaseFirestore.instance.collection('PaneerRice').add({
                      'Order By': _orderId.text,
                      'Order Weight': _orderWeight.text,
                      'Order Value': _orderValue.text,
                      'Order Contact': _contact.text,
                    });
                    _orderId.text = '';
                    _orderWeight.text = '';
                    _orderValue.text = '';
                    _contact.text = '';
                    Get.back();
                  },
                  child: Text('Confirm'),
                ),
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('Edit'),
                ),
              ],
              content: Column(
                children: [
                  Text('Order ID: ${_orderId.text}'),
                  Text('Order Weight: ${_orderWeight.text}'),
                  Text('Order Value: ${_orderValue.text}'),
                  Text('Order Contact: ${_contact.text}'),
                ],
              ),
            ));
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
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Column(
                  children: [
                    const Text(
                      "Order Id",
                      style: TextStyles.text,
                    ),
                    TextFormField(
                      controller: _orderId,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 5)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Order ID is required';
                        }
                        return null;
                      },
                    ),
                    const Text(
                      "Order Weight",
                      style: TextStyles.text,
                    ),
                    TextFormField(
                      controller: _orderWeight,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 5)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Order Weight is required';
                        }
                        return null;
                      },
                    ),
                    const Text(
                      "Order Value",
                      style: TextStyles.text,
                    ),
                    TextFormField(
                      controller: _orderValue,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 5)),
                      ),
                      keyboardType: const TextInputType.numberWithOptions(),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Order Value is required';
                        }
                        // You can add more specific validation here if needed
                        return null;
                      },
                    ),
                    const Text(
                      "Order Contact",
                      style: TextStyles.text,
                    ),
                    TextFormField(
                      controller: _contact,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 5)),
                      ),
                      keyboardType: const TextInputType.numberWithOptions(),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Order Contact is required';
                        }
                        return null;
                      },
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(() => PaneerOrderData());
                        },
                        child: Text("Order Data"))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
