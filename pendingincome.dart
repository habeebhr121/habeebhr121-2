import 'package:conut_fin/pages/balanceselection.dart';
import 'package:conut_fin/screens/homescreen.dart';
import 'package:flutter/material.dart';

class PendingIncome extends StatefulWidget {
  const PendingIncome({super.key});

  @override
  State<PendingIncome> createState() => _PendingIncomeState();
}

List visiblityValIncome = [0, 0, 0, 0, 0, 0, 0, 0];

class _PendingIncomeState extends State<PendingIncome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(221, 0, 9, 39),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        bottomcontrolval = 1;
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const Homepagescreen()));
                      },
                      icon: const Icon(Icons.arrow_back_sharp)),
                  const Text(
                    'Income Pending',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            incomePendingClass.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              visiblityValIncome[index] = 0;
                            });
                          },
                          onLongPress: () {
                            setState(() {
                              for (int i = 0;
                                  i < visiblityValIncome.length;
                                  i++) {
                                visiblityValIncome[i] = 0;
                              }
                              visiblityValIncome[index] = 1;
                            });
                          },
                          child: Card(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, bottom: 15, left: 15, right: 40),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    incomePendingClass[index]['Name'],
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Item: ${incomePendingClass[index]['Item Place']}',
                                        style: TextStyle(
                                            color: Colors.grey[700],
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "+${incomePendingClass[index]['Quantity or']}",
                                        style: TextStyle(
                                          color: Colors.green[700],
                                          fontWeight: FontWeight.w900,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Purchsed Date: ${incomePendingClass[index]['Date']}',
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Visibility(
                                    visible: visiblityValIncome[index] != 0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        TextButton.icon(
                                          onPressed: () {
                                            setState(() {
                                              delPending(
                                                  incomePendingClass[index].id);
                                              incomePendingClass
                                                  .removeAt(index);
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.delete_sweep_outlined,
                                            color: Colors.red,
                                          ),
                                          label: const Text(
                                            'Delete',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                        TextButton.icon(
                                          onPressed: () {
                                            setState(() {
                                              updatePending(
                                                  incomePendingClass[index].id);
                                              incomePendingClass
                                                  .removeAt(index);
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.clean_hands_outlined,
                                            color: Colors.blue,
                                          ),
                                          label: const Text(
                                            'Received',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: incomePendingClass.length,
                    ),
                  )
                : Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 60),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Opacity(
                              opacity: 0.4,
                              child: Image.asset(
                                'assets/images/no_element.png',
                                width: 200,
                                height: 200,
                              ),
                            ),
                            const Opacity(
                              opacity: 0.5,
                              child: Text(
                                "You don't have any pending income",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
