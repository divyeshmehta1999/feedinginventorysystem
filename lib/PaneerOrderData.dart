import 'package:anuaunty/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaneerOrderData extends StatefulWidget {
  const PaneerOrderData({super.key});

  @override
  State<PaneerOrderData> createState() => _PaneerOrderDataState();
}

class _PaneerOrderDataState extends State<PaneerOrderData> {
  CollectionReference _collectionRefPaneer =
      FirebaseFirestore.instance.collection('PaneerRice');

  List<DocumentSnapshot> paneerData = []; // Store the fetched data

  Future<void> getData() async {
    QuerySnapshot querySnapshot = await _collectionRefPaneer.get();

    // Get data as DocumentSnapshots
    paneerData = querySnapshot.docs;

    // Update the UI with the fetched data
    setState(() {});
  }

  // Function to delete an item
  void deleteItem(int index) async {
    DocumentSnapshot document = paneerData[index];

    // Delete data from Firestore
    await _collectionRefPaneer.doc(document.id).delete();

    // Remove the item from the local list
    setState(() {
      paneerData.removeAt(index);
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
        child: paneerData.isEmpty
            ? Center(
                child: Text('No data'),
              )
            : ListView.builder(
                itemCount: paneerData.length,
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
                                  'Ordered By: ${paneerData[index]['Order By']}',
                                  style: TextStyles
                                      .text, // Use your text style here
                                ),
                                Text(
                                  'Order Weight: ${paneerData[index]['Order Weight']}',
                                  style: TextStyles.text,
                                ),
                                Text(
                                  'Ordered Value: ${paneerData[index]['Order Value']}',
                                  style: TextStyles.text,
                                ),
                                Text(
                                  'Contact: ${paneerData[index]['Order Contact']}',
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
