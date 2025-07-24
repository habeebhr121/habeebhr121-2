import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conut_fin/pages/subtransaction/incomingfundstab.dart';
import 'package:conut_fin/screens/hometab.dart';
import 'package:conut_fin/screens/splashscreen.dart';
import 'package:flutter/material.dart';

class ShowItemsales extends StatefulWidget {
  final int elementVal;
  const ShowItemsales({super.key, required this.elementVal});

  @override
  State<ShowItemsales> createState() => ShowItemsalesState();
}

//QuerySnapshot? querySnapshotItem;
class ItemElement {
  String itemName;
  String itemAmount;
  String itemPrice;
  String itemQuantity;
  ItemElement({
    required this.itemName,
    required this.itemAmount,
    required this.itemPrice,
    required this.itemQuantity,
  });
}

final updaatePaidAmount = TextEditingController();

bool paidVisibleVal = false;
bool pageloadVal = true;
int stateValItems = 0;
List<ItemElement> itemObject = [];
List itemDoclist = [];

class ShowItemsalesState extends State<ShowItemsales> {
  @override
  Widget build(BuildContext context) {
    int elementIndex =
        salesDate[salesDate.length - 1 - widget.elementVal] % 1000;
    itemDoclist = saleItemClassList[elementIndex]['item DocId'];
    if (pageloadVal) {
      getItemfireb(elementIndex);
      pageloadVal = false;
    }
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            paidVisibleVal = !paidVisibleVal;
          });
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: const Color.fromARGB(221, 0, 9, 39),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, bottom: 20, left: 5, right: 5),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          itemObject.clear();
                          stateValItems = 0;
                          pageloadVal = true;
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back_sharp)),
                    const Text(
                      ' Transactions',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 5, right: 5, top: 0, bottom: 10),
                  child: Card(
                    color: Colors.white24,
                    elevation: 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      saleItemClassList[elementIndex]['Name'],
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                        'Account: ${saleItemClassList[elementIndex]['Account']}'),
                                    Text(
                                        'Comments: ${saleItemClassList[elementIndex]['comments']}')
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 80,
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                        'Date: ${saleItemClassList[elementIndex]['Date']}'),
                                    Text(
                                        'Total: ${saleItemClassList[elementIndex]['Total']}'),
                                    Text(
                                        'Paid: ${saleItemClassList[elementIndex]['PaidAmount']}'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: paidVisibleVal,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 120, vertical: 10),
                  child: Column(
                    children: [
                      const Text('Total Paid Amount'),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        style: const TextStyle(fontSize: 19),
                        textAlign: TextAlign.center,
                        controller: updaatePaidAmount,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          hintText:
                              "${saleItemClassList[elementIndex]['Total']}",
                        ),
                      ),
                      Container(
                        width: 100,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          updateSale(saleItemClassList[elementIndex].id,
                              updaatePaidAmount.text);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlueAccent),
                        child: const Text(
                          'Update',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Text(
                '   Items',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 5,
              ),
              stateValItems == itemDoclist.length
                  ? Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return SizedBox(
                            child: Card(
                              color: Colors.white24,
                              child: ListTile(
                                title: Text(itemObject[index].itemName),
                                subtitle: Text(
                                  'Price:  ${itemObject[index].itemPrice} x Qty:  ${itemObject[index].itemQuantity}',
                                ),
                                trailing: Text(
                                  itemObject[index].itemAmount,
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: itemObject.length,
                      ),
                    )
                  : const Expanded(
                      child: Center(
                      child: CircularProgressIndicator(),
                    ))
            ],
          ),
        ),
      ),
    );
  }

  Future getItemfireb(index) async {
    CollectionReference itemCollref =
        FirebaseFirestore.instance.collection('Income transaction Items');
    try {
      QuerySnapshot querySnapshot = await itemCollref.get();
      for (var itemDocId in saleItemClassList[index]['item DocId']) {
        for (var element in querySnapshot.docs) {
          if (element.id == itemDocId) {
            ItemElement itemSavedClass = ItemElement(
              itemName: element['item Name'],
              itemAmount: element['item Amount'],
              itemPrice: element['item Price'],
              itemQuantity: element['item Quantity'],
            );
            itemObject.add(itemSavedClass);
            stateValItems++;
            if (stateValItems == itemDoclist.length) {
              setState(() {});
            }
          }
        }
      }
    } catch (e) {}
  }

  Future updateSale(String docId, String amount) async {
    bool nextPageloadVal = false;
    FirebaseFirestore.instance
        .collection('Income Transaction')
        .doc(docId)
        .update({'PaidAmount': amount}).then((value) {
      setState(() {
        paidVisibleVal = false;
        itemObject.clear();
        stateValItems = 0;
        pageloadVal = true;
        nextPageloadVal = true;
        paidtexteditor.clear();
      Navigator.of(context).pop();
      });
    }).catchError((e) {});
    if(await salesList() && nextPageloadVal){
      Navigator.of(context).pop();
    }
  }
}
