import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conut_fin/pages/pendingList/canpending.dart';
import 'package:conut_fin/pages/pendingList/dryerpending.dart';
import 'package:conut_fin/pages/pendingList/orderbalance.dart';
import 'package:conut_fin/pages/pendingList/pendingexpense.dart';
import 'package:conut_fin/pages/pendingList/pendingincome.dart';
import 'package:conut_fin/pages/pendingList/stockpending.dart';
import 'package:flutter/material.dart';

List ordersPendingClass = [];
List incomePendingClass = [];
List expensePendingClass = [];
List dryerPendingClass = [];
List canCollectionClass = [];
List stockPendingClass = [];

class Balanceselection extends StatelessWidget {
  const Balanceselection({super.key});
  @override
  Widget build(BuildContext context) {
    List balanceIcon = const [
      Icon(Icons.trolley),
      Icon(Icons.clean_hands_outlined),
      Icon(Icons.trending_down_sharp),
      Icon(Icons.water_drop_outlined),
      Icon(Icons.streetview_rounded),
      Icon(Icons.refresh_rounded)
    ];
    List balanceText = const [
      'Orders',
      'Income Pending',
      'Expense Pending',
      'Dryer Pending',
      'Can Collection',
      'Stock Update'
    ];
    List balanceNotify = [
      ordersPendingClass.length,
      incomePendingClass.length,
      expensePendingClass.length,
      dryerPendingClass.length,
      canCollectionClass.length,
      stockPendingClass.length,
    ];
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Pending List',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 600,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 25,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 53, 122, 168),
                          child: balanceIcon[index],
                        ),
                        title: Text(
                          balanceText[index],
                          style: const TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w400),
                        ),
                        trailing: SizedBox(
                          width: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Visibility(
                                visible: balanceNotify[index] != 0,
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Card(
                                    color: Colors.red,
                                    shape: const CircleBorder(),
                                    child: Center(
                                        child: Text(
                                            balanceNotify[index].toString())),
                                  ),
                                ),
                              ),
                              const Icon(Icons.arrow_right)
                            ],
                          ),
                        ),
                        onTap: () {
                          switch (index) {
                            case 0:
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (builder) {
                                    return const Orderbalance();
                                  },
                                ),
                              );
                              break;
                            case 1:
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (builder) {
                                    return const PendingIncome();
                                  },
                                ),
                              );
                              break;
                            case 2:
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (builder) {
                                    return const PendingExpense();
                                  },
                                ),
                              );
                              break;
                            case 3:
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (builder) {
                                    return const DryerPendind();
                                  },
                                ),
                              );
                              break;
                            case 4:
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (builder) {
                                    return const CanPending();
                                  },
                                ),
                              );
                              break;
                            case 5:
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (builder) {
                                    return const StockPending();
                                  },
                                ),
                              );
                              break;
                          }
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 25,
                    );
                  },
                  itemCount: 6,
                )),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

Future delPending(String docId) async {
  FirebaseFirestore.instance
      .collection('PendingList')
      .doc(docId)
      .delete()
      .then((value) {})
      .catchError((e) {});
}

Future updatePending(String docId) async {
  FirebaseFirestore.instance
      .collection('PendingList')
      .doc(docId)
      .update({'Delivered': '0'}).then((value){
      }).catchError((e){});
}
