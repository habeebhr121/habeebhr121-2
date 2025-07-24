import 'package:conut_fin/pages/balanceselection.dart';
import 'package:conut_fin/pages/showallsales.dart';
import 'package:conut_fin/screens/hometab.dart';
import 'package:flutter/material.dart';


class Homepagescreen extends StatefulWidget {
  
  const Homepagescreen({super.key});

  @override
  State<Homepagescreen> createState() => _HomepagescreenState();
}
int bottomcontrolval = 0;
class _HomepagescreenState extends State<Homepagescreen> {
  
  @override
  Widget build(BuildContext context) {
    List pages = const [Hometab(), Balanceselection(), Showallsales()];
    return Scaffold(
      backgroundColor: const Color.fromARGB(221, 0, 9, 39),
      body: pages[bottomcontrolval],
      //-------------------------------------------------------Bottom Naviagation----------------------------------
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long_outlined), label: 'Pending'),
          BottomNavigationBarItem(icon: Icon(Icons.attach_money_sharp), label: 'Transactions'),
        ],
        onTap: (value) {
          setState(() {
            bottomcontrolval = value;
          });
        },
        backgroundColor: Colors.transparent,
        currentIndex: bottomcontrolval,
        selectedItemColor: Colors.blue,
        showUnselectedLabels: false,
        showSelectedLabels: false,
      ),
    );
  }
}
