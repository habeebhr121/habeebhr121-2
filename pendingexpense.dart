import 'package:conut_fin/pages/balanceselection.dart';
import 'package:conut_fin/screens/homescreen.dart';
import 'package:flutter/material.dart';

class PendingExpense extends StatefulWidget {
  const PendingExpense({super.key});

  @override
  State<PendingExpense> createState() => _PendingExpenseState();
}

List visiblityValExpense = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

class _PendingExpenseState extends State<PendingExpense> {
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
                    'Expense Pending',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            expensePendingClass.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              visiblityValExpense[index] = 0;
                            });
                          },
                          onLongPress: () {
                            setState(() {
                              for (int i = 0;
                                  i < visiblityValExpense.length;
                                  i++) {
                                visiblityValExpense[i] = 0;
                              }
                              visiblityValExpense[index] = 1;
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
                                    expensePendingClass[index]['Name'],
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
                                        'Item: ${expensePendingClass[index]['Item Place']}',
                                        style: TextStyle(
                                            color: Colors.grey[700],
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "-${expensePendingClass[index]['Quantity or']}",
                                        style: TextStyle(
                                          color: Colors.red[700],
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
                                        'Purchsed Date: ${expensePendingClass[index]['Date']}',
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Visibility(
                                    visible: visiblityValExpense[index] != 0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        TextButton.icon(
                                          onPressed: () {
                                            setState(() {
                                              delPending(
                                                  expensePendingClass[index]
                                                      .id);
                                              expensePendingClass
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
                                                  expensePendingClass[index]
                                                      .id);
                                              expensePendingClass
                                                  .removeAt(index);
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.trending_down,
                                            color: Colors.blue,
                                          ),
                                          label: const Text(
                                            'Paid',
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
                      itemCount: expensePendingClass.length,
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
                                "You don't have any pending expenses",
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
