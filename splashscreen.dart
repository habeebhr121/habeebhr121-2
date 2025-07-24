import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conut_fin/pages/balanceselection.dart';
import 'package:conut_fin/screens/Loginscreen.dart';
import 'package:conut_fin/screens/homescreen.dart';
import 'package:conut_fin/screens/hometab.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

bool statisticsState = true;
List monthdays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
List<int> total30 = [];

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    total30.clear;
    delayFunc(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 70,
              ),
              Center(
                child: Container(
                  width: 500,
                  height: 500,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/IMG_8887.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Conut Fin is a Financial app, helps you to know about your financial states through different types of charts',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blueGrey),
                ),
              ),
              Container()
            ],
          ),
        ],
      ),
    );
  }

  Future<void> delayFunc(BuildContext context) async {
    //bool? loginVal = false;
    salesList();
    pendingListget();
    //getItemfireb();
    final sharedpref = await SharedPreferences.getInstance();
    final loginVal = sharedpref.getBool('LoginVal');
    await Future.delayed(
      const Duration(seconds: 5),
    );
    if (loginVal != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return const Homepagescreen();
          },
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return const LoginScreen();
          },
        ),
      );
    }
  }
}

Future<bool> salesList() async {
  DateTime currentDate = DateTime.now();
  total30 = List.generate(monthdays[currentDate.month - 1], (index) => 0);
  int saleListOrder = 000;
  saleItemClassList.clear();
  salesDate.clear();
  CollectionReference salesItemsCollref =
      FirebaseFirestore.instance.collection('Income Transaction');
  QuerySnapshot salesQuerySnapshot = await salesItemsCollref.get();

  for (var element in salesQuerySnapshot.docs) {
    saleItemClassList.add(element);
    List dateSplit = element['Date'].split("-");
    String concatinatedDate = dateSplit[2] +
        dateSplit[1] +
        dateSplit[0] +
        saleListOrder.toString().padLeft(3, '0');
    saleListOrder++;
    salesDate.add(int.parse(concatinatedDate));
    salesDate.sort();
    //print(salesDate);
    //print((int.parse(concatinatedDate) % 100).toString());

    if (true) {
      if (int.parse(element['PaidAmount']) < 4000) {
        calcStaitstics(
            int.parse(dateSplit[1]), int.parse(dateSplit[2]), element);

        if (currentDate.year == int.parse(dateSplit[2]) &&
            currentDate.month == int.parse(dateSplit[1])) {
          for (int i = 1; i <= monthdays[currentDate.month - 1]; i++) {
            if (int.parse(dateSplit[0]) == i) {
              total30[i] = total30[i] + int.parse(element['PaidAmount']);
            }
          }
        }
      }
    }
  }
  statisticsState = false;
  return true;
}

int monthCalc(int month, int subVal) {
  if ((month - subVal) < 1) {
    return 12 + (month - subVal);
  } else {
    return month - subVal;
  }
}

void calcStaitstics(int salesMonth, int salesYear, var element) {
  DateTime currentDate = DateTime.now();
  if (salesMonth == currentDate.month && salesYear == currentDate.year) {
    totalMonthPaid = totalMonthPaid + int.parse(element['PaidAmount']);
  } else if (salesMonth == monthCalc(currentDate.month, 1) &&
      salesYear == currentDate.year) {
    totalPrevMonthPaid1 =
        totalPrevMonthPaid1 + int.parse(element['PaidAmount']);
  } else if (salesMonth == monthCalc(currentDate.month, 2) &&
      salesYear == currentDate.year) {
    totalPrevMonthPaid2 =
        totalPrevMonthPaid2 + int.parse(element['PaidAmount']);
  } else if (salesMonth == monthCalc(currentDate.month, 3) &&
      salesYear == currentDate.year) {
    totalPrevMonthPaid3 =
        totalPrevMonthPaid3 + int.parse(element['PaidAmount']);
  } else if (salesMonth == monthCalc(currentDate.month, 4) &&
      salesYear == currentDate.year) {
    totalPrevMonthPaid4 =
        totalPrevMonthPaid4 + int.parse(element['PaidAmount']);
  }
}

Future<bool> pendingListget() async {
  ordersPendingClass.clear();
  incomePendingClass.clear();
  expensePendingClass.clear();
  dryerPendingClass.clear();
  canCollectionClass.clear();
  stockPendingClass.clear();
  CollectionReference pendingGetref =
      FirebaseFirestore.instance.collection('PendingList');
  QuerySnapshot pendingQuery = await pendingGetref.get();
  for (var element in pendingQuery.docs) {
    if (element['Delivered'] == '1') {
      switch (element['Type of pending']) {
        case 'Orders':
          ordersPendingClass.add(element);
          break;
        case 'Income Pending':
          incomePendingClass.add(element);
          break;
        case 'Expense Pending':
          expensePendingClass.add(element);
          break;
        case 'Dryer Pending':
          dryerPendingClass.add(element);
          break;
        case 'Can Collection':
          canCollectionClass.add(element);
          break;
        case 'Stock Update':
          stockPendingClass.add(element);
          break;
      }
    }
  }
  return true;
}
