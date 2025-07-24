
import 'package:conut_fin/pages/balanceselection.dart';
import 'package:conut_fin/screens/homescreen.dart';
import 'package:flutter/material.dart';

class StockPending extends StatefulWidget {
  const StockPending({super.key});

  @override
  State<StockPending> createState() => _StockPendingState();
}

List visiblityValStockPending = [0,0,0,0,0,0,0,0,0,0];

class _StockPendingState extends State<StockPending> {
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
                        bottomcontrolval =1;
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const Homepagescreen()));
                      },
                      icon: const Icon(Icons.arrow_back_sharp)),
                  const Text(
                    'Stock Collection',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            stockPendingClass.isNotEmpty
            ?Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        visiblityValStockPending[index] = 0;
                      });
                    },
                    onLongPress: () {
                      setState(() {
                        for (int i = 0; i < visiblityValStockPending.length; i++) {
                          visiblityValStockPending[i] = 0;
                        }
                        visiblityValStockPending[index] = 1;
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
                              stockPendingClass[index]['Name'],
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Place: ${stockPendingClass[index]['Item Place']}',
                                  style: TextStyle(
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Avg items: ${stockPendingClass[index]['Quantity or']}',
                                  style: TextStyle(
                                    color: Colors.blue[700],
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Date: ${stockPendingClass[index]['Date']}',
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Visibility(
                              visible: visiblityValStockPending[index] != 0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextButton.icon(
                                    onPressed: () {
                                      setState(() {
                                        delPending(stockPendingClass[index].id);
                                        stockPendingClass.removeAt(index);
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
                                            stockPendingClass[index].id);
                                            stockPendingClass.removeAt(index);
                                      });

                                    },
                                    icon: const Icon(
                                      Icons.shopping_cart_checkout,
                                      color: Colors.blue,
                                    ),
                                    label: const Text(
                                      'Collected',
                                      style: TextStyle(color: Colors.blue),
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
                itemCount: stockPendingClass.length,
              ),
            )
            :Expanded(
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
                                "You don't have any pending stock collection",
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