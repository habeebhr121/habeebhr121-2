import 'dart:math';

import 'package:conut_fin/pages/addbalance.dart';
import 'package:conut_fin/pages/showallsales.dart';
import 'package:conut_fin/screens/splashscreen.dart';
import 'package:conut_fin/screens/transactions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

List<int> salesDate = [];
List saleItemClassList = [];
double totalMonthPaid = 0;
double totalPrevMonthPaid1 = 0;
double totalPrevMonthPaid2 = 0;
double totalPrevMonthPaid3 = 0;
double totalPrevMonthPaid4 = 0;
List monthName = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec'
];
List circularUserPics = [
 // 'assets/images/person.jpg',
  //'assets/images/user1.jpg',
  //'assets/images/user2.png',
  //'assets/images/userProfile/user3.jpeg',
 // 'assets/images/userProfile/user4.png',
  //'assets/images/userProfile/user5.webp',
  //'assets/images/userProfile/user6.jpg',
  //'assets/images/userProfile/user7.webp',
  'assets/images/userProfile/user8.png',
];

class Hometab extends StatefulWidget {
  const Hometab({super.key});

  @override
  State<Hometab> createState() => _HometabState();
}

class _HometabState extends State<Hometab> {
  @override
  Widget build(BuildContext context) {
    int lenLasttotal30 = 3;
    for (int i = total30.length - 1; i > 0; i--) {
      if (total30[i] != 0) {
        lenLasttotal30 = i;
        break;
      }
    }
    DateTime currentDate = DateTime.now();
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/homewalp2.jpg'),
              fit: BoxFit.cover)),
      child: SafeArea(
        child: Column(
          children: [
            //---------First Appbar name and profile-----------
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Card(
                  //   shape: const CircleBorder(),
                  //   child: IconButton(
                  //     onPressed: () {
                  //       print(_currentDate);
                  //     },
                  //     icon: const Icon(Icons.menu, size: 29),
                  //   ),
                  // ),
                  const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      'Conut Fin',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      salesList();
                    },
                    icon: const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/userProfile/user3.jpeg'),
                    ),
                  ),
                ],
              ),
            ),
            //-----------------------------------------Monthly Financial statement section-----------------------------------
            SizedBox(
              height: 150,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  //-------------------One card starts-----------
                  Card(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    color: Colors.transparent,
                    elevation: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Opacity(
                            opacity: 0.75,
                            child: Text(
                              "Retail Sales",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: 100,
                            width: 150,
                            child: BarChart(
                              BarChartData(
                                barGroups: [
                                  BarChartGroupData(x: 0, barRods: [
                                    BarChartRodData(
                                        toY: totalPrevMonthPaid4,
                                        width: 20,
                                        borderRadius: BorderRadius.circular(4))
                                  ]),
                                  BarChartGroupData(x: 1, barRods: [
                                    BarChartRodData(
                                        toY: totalPrevMonthPaid3,
                                        width: 20,
                                        borderRadius: BorderRadius.circular(4))
                                  ]),
                                  BarChartGroupData(x: 2, barRods: [
                                    BarChartRodData(
                                        toY: totalPrevMonthPaid2,
                                        width: 20,
                                        borderRadius: BorderRadius.circular(4))
                                  ]),
                                  BarChartGroupData(x: 3, barRods: [
                                    BarChartRodData(
                                        toY: totalPrevMonthPaid1,
                                        width: 20,
                                        borderRadius: BorderRadius.circular(4))
                                  ]),
                                  BarChartGroupData(x: 4, barRods: [
                                    BarChartRodData(
                                        toY: totalMonthPaid,
                                        width: 20,
                                        borderRadius: BorderRadius.circular(4))
                                  ]),
                                ],
                                titlesData: FlTitlesData(
                                  show: true,
                                  leftTitles: const AxisTitles(
                                      sideTitles:
                                          SideTitles(showTitles: false)),
                                  rightTitles: const AxisTitles(
                                      sideTitles:
                                          SideTitles(showTitles: false)),
                                  topTitles: const AxisTitles(
                                      //axisNameWidget: Text('Retail Sales',style: TextStyle(fontWeight: FontWeight.w500,fontStyle: FontStyle.italic),),
                                      sideTitles:
                                          SideTitles(showTitles: false)),
                                  bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      getTitlesWidget: (value, meta) {
                                        switch (value.toInt()) {
                                          case 0:
                                            return Text(
                                              monthName[monthCalc(
                                                      currentDate.month, 4) -
                                                  1],
                                              style:
                                                  const TextStyle(fontSize: 10),
                                            );
                                          case 1:
                                            return Text(
                                              monthName[monthCalc(
                                                      currentDate.month, 3) -
                                                  1],
                                              style:
                                                  const TextStyle(fontSize: 10),
                                            );
                                          case 2:
                                            return Text(
                                              monthName[monthCalc(
                                                      currentDate.month, 2) -
                                                  1],
                                              style:
                                                  const TextStyle(fontSize: 10),
                                            );
                                          case 3:
                                            return Text(
                                              monthName[monthCalc(
                                                      currentDate.month, 1) -
                                                  1],
                                              style:
                                                  const TextStyle(fontSize: 10),
                                            );
                                          case 4:
                                            return Text(
                                              monthName[monthCalc(
                                                      currentDate.month, 0) -
                                                  1],
                                              style:
                                                  const TextStyle(fontSize: 10),
                                            );
                                          default:
                                            return const Text(
                                              'Jan',
                                              style: TextStyle(fontSize: 10),
                                            );
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                borderData: FlBorderData(
                                  show: false,
                                ), // Hide border around the chart

                                gridData: const FlGridData(
                                    show: false), // Show grid lines
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //------------------------one card ends----------------
                  Card(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    color: Colors.transparent,
                    elevation: 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 100,
                            width: 180,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: LineChart(
                                LineChartData(
                                  gridData: const FlGridData(show: false),
                                  borderData: FlBorderData(show: false),
                                  titlesData: const FlTitlesData(
                                    leftTitles: AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false)),
                                    rightTitles: AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false)),
                                    topTitles: AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false)),
                                    bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                  ),
                                  lineBarsData: [
                                    LineChartBarData(
                                      spots: List.generate(
                                        lenLasttotal30 + 1,
                                        (index) {
                                          return FlSpot(index.toDouble(),
                                              total30[index].toDouble());
                                        },
                                      ),
                                      isCurved: true,
                                      color: Colors.blue,
                                      barWidth: 2,
                                      isStrokeCapRound: false,
                                      belowBarData: BarAreaData(show: true),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Opacity(
                            opacity: 0.75,
                            child: Text(
                              "Income of days",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //-------------------------------------------Sub Icon button section------------------------------------
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const TransactionPage();
                      }));
                    },
                    child: const Card(
                      color: Colors.transparent,
                      elevation: 50,
                      shape: CircleBorder(),
                      child: SizedBox(
                        child: SizedBox(
                          height: 70,
                          width: 70,
                          child: Icon(
                            Icons.stacked_line_chart_outlined,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AddBalance(),
                      ),
                    ),
                    child: const Card(
                      color: Colors.transparent,
                      elevation: 50,
                      shape: CircleBorder(),
                      child: SizedBox(
                        child: SizedBox(
                          height: 70,
                          width: 70,
                          child: Icon(
                            Icons.add_home_work_outlined,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Card(
                    color: Colors.transparent,
                    elevation: 50,
                    shape: CircleBorder(),
                    child: SizedBox(
                      child: SizedBox(
                        height: 70,
                        width: 70,
                        child: Icon(
                          Icons.receipt,
                        ),
                      ),
                    ),
                  ),
                  const Card(
                    color: Colors.transparent,
                    elevation: 50,
                    shape: CircleBorder(),
                    child: SizedBox(
                      child: SizedBox(
                        height: 70,
                        width: 70,
                        child: Icon(
                          Icons.more_horiz,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Transactions',
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const Showallsales();
                      }));
                    },
                    child: const Text('see all'),
                  ),
                ],
              ),
            ),
            //-------------------------------list view of orders and transactions-------------------------
            saleItemClassList.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        int elementSelection =
                            salesDate[salesDate.length - 1 - index] % 1000;
                        return Card(
                          elevation: 20,
                          color: Colors.transparent,
                          child: ListTile(
                            title: Text(
                                saleItemClassList[elementSelection]['Name']),
                            subtitle: Text(
                                saleItemClassList[elementSelection]['Date']),
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(circularUserPics[
                                  Random().nextInt(circularUserPics.length)]),
                                  
                            ),
                            trailing: Text(
                              saleItemClassList[elementSelection]['PaidAmount']
                                  .toString(),
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                        );
                      },
                      itemCount: 10,
                    ),
                  )
                : const Expanded(
                    child: Center(child: CircularProgressIndicator())),
          ],
        ),
      ),
    );
  }
}
