
import 'package:conut_fin/pages/balanceselection.dart';
import 'package:conut_fin/screens/homescreen.dart';
import 'package:flutter/material.dart';

class CanPending extends StatefulWidget {
  const CanPending({super.key});

  @override
  State<CanPending> createState() => _CanPendingState();
}

List visiblityValCanPending = [0,0,0,0,0,0,0,0,0,0];

class _CanPendingState extends State<CanPending> {
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
                    'Can Collection',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            canCollectionClass.isNotEmpty
            ?Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        visiblityValCanPending[index] = 0;
                      });
                    },
                    onLongPress: () {
                      setState(() {
                        for (int i = 0; i < visiblityValCanPending.length; i++) {
                          visiblityValCanPending[i] = 0;
                        }
                        visiblityValCanPending[index] = 1;
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
                              canCollectionClass[index]['Name'],
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
                                  'Place: ${canCollectionClass[index]['Item Place']}',
                                  style: TextStyle(
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'No of items: ${canCollectionClass[index]['Quantity or']}',
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
                                  'Collected Date: ${canCollectionClass[index]['Date']}',
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Visibility(
                              visible: visiblityValCanPending[index] != 0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextButton.icon(
                                    onPressed: () {
                                      setState(() {
                                        delPending(canCollectionClass[index].id);
                                        canCollectionClass.removeAt(index);
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
                                        setState(() {
                                        
                                        updatePending(
                                            canCollectionClass[index].id);
                                            canCollectionClass.removeAt(index);
                                      });
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
                itemCount: canCollectionClass.length,
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
                                "You don't have any pending can collection",
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