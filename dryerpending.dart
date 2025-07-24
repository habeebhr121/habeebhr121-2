import 'package:conut_fin/pages/balanceselection.dart';
import 'package:conut_fin/screens/homescreen.dart';
import 'package:flutter/material.dart';

class DryerPendind extends StatefulWidget {
  const DryerPendind({super.key});

  @override
  State<DryerPendind> createState() => _DryerPendindState();
}

List visiblityValDryerPending = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

class _DryerPendindState extends State<DryerPendind> {
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
                    'Dryer Pending',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            dryerPendingClass.isNotEmpty
            ?Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        visiblityValDryerPending[index] = 0;
                      });
                    },
                    onLongPress: () {
                      setState(() {
                        for (int i = 0;
                            i < visiblityValDryerPending.length;
                            i++) {
                          visiblityValDryerPending[i] = 0;
                        }
                        visiblityValDryerPending[index] = 1;
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
                              dryerPendingClass[index]['Name'],
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
                                  'Place: ${dryerPendingClass[index]['Item Place']}',
                                  style: TextStyle(
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Qty: ${dryerPendingClass[index]['Quantity or']}',
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
                                  'Collected Date: ${dryerPendingClass[index]['Date']}',
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Visibility(
                              visible: visiblityValDryerPending[index] != 0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextButton.icon(
                                    onPressed: () {
                                      setState(
                                        () {
                                          delPending(
                                              dryerPendingClass[index].id);
                                          dryerPendingClass.removeAt(index);
                                        },
                                      );
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
                                            dryerPendingClass[index].id);
                                        dryerPendingClass.removeAt(index);
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.delivery_dining_outlined,
                                      color: Colors.blue,
                                    ),
                                    label: const Text(
                                      'Delivered',
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
                itemCount: dryerPendingClass.length,
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
                                "You don't have any dryer pending",
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
