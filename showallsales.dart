import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conut_fin/pages/showitemssale.dart';
import 'package:conut_fin/screens/homescreen.dart';
import 'package:conut_fin/screens/hometab.dart';
import 'package:conut_fin/screens/splashscreen.dart';
import 'package:flutter/material.dart';

class Showallsales extends StatefulWidget {
  const Showallsales({super.key});

  @override
  State<Showallsales> createState() => _ShowallsalesState();
}

class _ShowallsalesState extends State<Showallsales> {
  List sortNamesSales = [
    'Incoming Funds',
    'Expense Funds',
    'Internal transfer'
  ];
  String selectedSortName = "";
  bool delValue = true;

  @override
  Widget build(BuildContext context) {
    //pageloadVal = true;
    stateValItems = 0;
    itemObject.clear();
    return SafeArea(
      child: Container(
        color: const Color.fromARGB(221, 0, 9, 39),
        child: Column(
          children: [
            Card(
              color: Colors.transparent,
              elevation: 35,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {
                              bottomcontrolval = 0;
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (context) {
                                return const Homepagescreen();
                              }), (route) => false);
                            },
                            icon: const Icon(Icons.arrow_back)),
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
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 170,
                          child: DropdownButtonFormField(
                              hint: const Text('Select type'),
                              decoration: const InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  border: OutlineInputBorder()),
                              items: sortNamesSales.map((e) {
                                return DropdownMenuItem(
                                    value: e, child: Text(e));
                              }).toList(),
                              onChanged: ((value) {
                                selectedSortName = value.toString();
                              })),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            saleItemClassList.isNotEmpty
                ? Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 3),
                      child: saleItemClassList.isNotEmpty
                          ? ListView.builder(
                              itemBuilder: (context, index) {
                                int elementSelection =
                                    salesDate[salesDate.length - 1 - index] %
                                        1000;
                                // print("re checiing: ${saleItemClassList.length}");
                                // print('sale date rechecking:${salesDate.length}');
                                return Card(
                                  elevation: 20,
                                  color: delValue
                                      ? Colors.transparent
                                      : Colors.white24,
                                  child: ListTile(
                                    onLongPress: () {
                                      setState(() {
                                        delValue = false;
                                      });
                                    },
                                    onTap: () {
                                      setState(() {
                                        if (delValue) {
                                          itemObject.clear();
                                          stateValItems = 0;
                                          pageloadVal = true;
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return ShowItemsales(
                                                  elementVal: index,
                                                );
                                              },
                                            ),
                                          );
                                        } else {
                                          delValue = true;
                                        }
                                      });
                                    },
                                    title: Text(
                                        saleItemClassList[elementSelection]
                                            ['Name']),
                                    subtitle: Text(
                                        saleItemClassList[elementSelection]
                                            ['Date']),
                                    leading: const CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/userProfile/user8.png'),
                                    ),
                                    trailing: delValue
                                        ? Text(
                                            saleItemClassList[elementSelection]
                                                    ['PaidAmount']
                                                .toString(),
                                            style:
                                                const TextStyle(fontSize: 18),
                                          )
                                        : IconButton(
                                            onPressed: () {
                                              delSales(
                                                  saleItemClassList[
                                                          elementSelection]
                                                      .id,
                                                  elementSelection);
                                            },
                                            icon: const Icon(
                                              Icons.delete_sweep_outlined,
                                              color: Colors.red,
                                            ),
                                          ),
                                  ),
                                );
                              },
                              itemCount: saleItemClassList.length,
                            )
                          : const Expanded(
                              child:
                                  Center(child: Text("No elements are there"))),
                    ),
                  )
                : const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Future delSales(String docId, int indexVal) async {
    for (var i in saleItemClassList[indexVal]['item DocId']) {
      FirebaseFirestore.instance
          .collection('Income transaction Items')
          .doc(i)
          .delete()
          .then((value) {})
          .catchError((e) {});
    }
    FirebaseFirestore.instance
        .collection('Income Transaction')
        .doc(docId)
        .delete()
        .then((value) {
      salesList();
    }).catchError((e) {});
    bottomcontrolval = 0;
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
      return const Homepagescreen();
    }), (route) => false);
  }
}
