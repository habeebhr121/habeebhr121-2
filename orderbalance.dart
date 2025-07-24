import 'package:conut_fin/pages/balanceselection.dart';
import 'package:conut_fin/screens/homescreen.dart';
import 'package:flutter/material.dart';

class Orderbalance extends StatefulWidget {
  const Orderbalance({super.key});

  @override
  State<Orderbalance> createState() => _OrderbalanceState();
}

List<int> visiblityValOrders = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

class _OrderbalanceState extends State<Orderbalance> {
  @override
  Widget build(BuildContext context) {
    print(ordersPendingClass.length);
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
                    'Orders',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            ordersPendingClass.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              visiblityValOrders[index] = 0;
                            });
                          },
                          onLongPress: () {
                            setState(() {
                              for (int i = 0;
                                  i < visiblityValOrders.length;
                                  i++) {
                                visiblityValOrders[i] = 0;
                              }
                              visiblityValOrders[index] = 1;
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
                                    ordersPendingClass[index]['Name'],
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
                                        'Item: ${ordersPendingClass[index]['Item Place']}',
                                        style: TextStyle(
                                            color: Colors.grey[700],
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        'Quantity: ${ordersPendingClass[index]['Quantity or']}',
                                        style: TextStyle(
                                            color: Colors.grey[700],
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Ordered Date: ${ordersPendingClass[index]['Date']}',
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Visibility(
                                    visible: visiblityValOrders[index] != 0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        TextButton.icon(
                                          onPressed: () {
                                            setState(() {
                                              delPending(
                                                  ordersPendingClass[index].id);
                                              ordersPendingClass
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
                                                  ordersPendingClass[index].id);
                                              ordersPendingClass
                                                  .removeAt(index);
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.done_all_sharp,
                                            color: Colors.blue,
                                          ),
                                          label: const Text(
                                            'Delivered',
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
                      itemCount: ordersPendingClass.length,
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
                                "You haven't placed any orders",
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
