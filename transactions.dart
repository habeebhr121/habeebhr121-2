import 'package:conut_fin/pages/subtransaction/Internaltransfertab.dart';
import 'package:conut_fin/pages/subtransaction/expendituretab.dart';
import 'package:conut_fin/pages/subtransaction/incomingfundstab.dart';
import 'package:conut_fin/screens/homescreen.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({
    super.key,
  });

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  int payvalue1 = 0;
  int payvalue2 = 1;
  int payvalue3 = 1;
  Widget currenttab = const IncomeFundingWidget();
  List<Color> colortabs = [Colors.blue, Colors.transparent];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(221, 0, 9, 39),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) {
                          return const Homepagescreen();
                        }), (route) => false);
                      },
                      icon: const Icon(Icons.arrow_back)),
                  const Text(
                    'Add Transaction',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none),
                  ),
                ],
              ),
            ),
            //--------------------------Type selection of payment----------------------------
            SizedBox(
              height: 95,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    children: [
                      TapRegion(
                        onTapInside: (event) {
                          setState(() {
                            payvalue1 = 0;
                            payvalue2 = 1;
                            payvalue3 = 1;
                            currenttab = const IncomeFundingWidget();
                          });
                        },
                        child: Card(
                          elevation: 25,
                          color: colortabs[payvalue1],
                          child: const Padding(
                            padding: EdgeInsets.only(
                                left: 8, right: 8, top: 20, bottom: 20),
                            child: Column(
                              children: [
                                Icon(Icons.real_estate_agent_outlined),
                                Text('Incoming funds'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      TapRegion(
                        onTapInside: (event) {
                          setState(() {
                            payvalue1 = 1;
                            payvalue2 = 0;
                            payvalue3 = 1;
                            currenttab = const Expendituretab();
                          });
                        },
                        child: Card(
                          elevation: 25,
                          color: colortabs[payvalue2],
                          child: const Padding(
                            padding: EdgeInsets.only(
                                left: 8, right: 8, top: 20, bottom: 20),
                            child: Column(
                              children: [
                                Icon(Icons.trending_down_rounded),
                                Text('Expenditure funds'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      TapRegion(
                        onTapInside: (event) {
                          setState(() {
                            payvalue1 = 1;
                            payvalue2 = 1;
                            payvalue3 = 0;
                            currenttab = const InternalTransfertab();
                          });
                        },
                        child: Card(
                          color: colortabs[payvalue3],
                          elevation: 25,
                          child: const Padding(
                            padding: EdgeInsets.only(
                                left: 8, right: 8, top: 20, bottom: 20),
                            child: Column(
                              children: [
                              
                                Icon(Icons.receipt_long_outlined),
                                Text('Internal transfer'),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),

            currenttab,
          ],
        ),
      ),
    );
  }
}
