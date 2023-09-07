import 'package:anuaunty/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChickenOrderData extends StatefulWidget {
  const ChickenOrderData({super.key});

  @override
  State<ChickenOrderData> createState() => _ChickenOrderDataState();
}

class _ChickenOrderDataState extends State<ChickenOrderData> {
  CollectionReference _collectionRefChicken =
      FirebaseFirestore.instance.collection('ChickenRice');

  List<DocumentSnapshot> chickenData = []; // Store the fetched data

  Future<void> getData() async {
    QuerySnapshot querySnapshot = await _collectionRefChicken.get();

    // Get data as DocumentSnapshots
    chickenData = querySnapshot.docs;

    // Update the UI with the fetched data
    setState(() {});
  }

  // Function to delete an item
  void deleteItem(int index) async {
    DocumentSnapshot document = chickenData[index];

    // Delete data from Firestore
    await _collectionRefChicken.doc(document.id).delete();

    // Remove the item from the local list
    setState(() {
      chickenData.removeAt(index);
    });
  }

  @override
  void initState() {
    super.initState();
    getData(); // Fetch data when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: getData,
        child: chickenData.isEmpty
            ? Center(
                child: Text('No data'),
              )
            : ListView.builder(
                itemCount: chickenData.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 150,
                    width: 200,
                    child: Card(
                      color: Colors.black.withOpacity(0.5),
                      child: Row(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Text(
                                  'Ordered By: ${chickenData[index]['Order By']}',
                                  style: TextStyles
                                      .text, // Use your text style here
                                ),
                                Text(
                                  'Order Weight: ${chickenData[index]['Order Weight']}',
                                  style: TextStyles.text,
                                ),
                                Text(
                                  'Ordered Value: ${chickenData[index]['Order Value']}',
                                  style: TextStyles.text,
                                ),
                                Text(
                                  'Contact: ${chickenData[index]['Order Contact']}',
                                  style: TextStyles.text,
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Get.dialog(AlertDialog(
                                title: Text('Confirm Delete?'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: Text('No')),
                                  TextButton(
                                      onPressed: () {
                                        deleteItem(index);
                                        Get.back();
                                      },
                                      child: Text('Yes')),
                                ],
                              ));
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
