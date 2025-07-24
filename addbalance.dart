import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conut_fin/screens/homescreen.dart';
import 'package:conut_fin/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddBalance extends StatefulWidget {
  const AddBalance({super.key});

  @override
  State<AddBalance> createState() => _AddBalanceState();
}

class _AddBalanceState extends State<AddBalance> {
  List pendingTypes = [
    'Orders',
    'Income Pending',
    'Expense Pending',
    'Dryer Pending',
    'Can Collection',
    'Stock Update'
  ];
  String pendingSelection = "";
  final DateTime _currentDate = DateTime.now();
  String _formattedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  String balanceQuantityText = 'Quantity';
  String balanceItemText = 'item';
  final pendingNameTextEditor = TextEditingController();
  final pendingQuantityTextEditor = TextEditingController();
  final pendingItemTextEditor = TextEditingController();
  final pendingKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(221, 0, 9, 39),
      body: SafeArea(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back)),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Add Pending List',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: SizedBox(
                height: 150,
                width: double.infinity,
                child: Card(
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      image:const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/pendingOilPic.jpg'),
                      ),
                    ),
                    // child: Text(
                    //   'data',
                    //   style: TextStyle(color: Colors.black),
                    // ),
                  ),
                ),
              ),
            ),
            Form(
              key: pendingKey,
              child: Card(
                elevation: 50,
                color: Colors.transparent,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Add Pending',
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DropdownButtonFormField(
                        hint: const Text('Type of pending'),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(19))),
                        items: pendingTypes.map((e) {
                          return DropdownMenuItem(value: e, child: Text(e));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            pendingSelection = value.toString();
                            switch (pendingSelection) {
                              case 'Orders':
                                balanceQuantityText = 'Quantiy';
                                balanceItemText = 'Item';
                                break;
                              case 'Income Pending':
                                balanceQuantityText = 'Amount';
                                balanceItemText = 'Item';
                                break;
                              case 'Expense Pending':
                                balanceQuantityText = 'Amount';
                                balanceItemText = 'Item';
                                break;
                              case 'Dryer Pending':
                                balanceQuantityText = 'Type';
                                balanceItemText = 'Place';
                                break;
                              case 'Can Collection':
                                balanceQuantityText = 'No of items';
                                balanceItemText = 'Place';
                                break;
                              case 'Stock Update':
                                balanceQuantityText = 'Avg items';
                                balanceItemText = 'Place';
                                break;
                            }
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: pendingNameTextEditor,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter the value';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(19),
                          ),
                          labelText: 'Name',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 125,
                            child: TextFormField(
                              controller: pendingQuantityTextEditor,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter the value';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                labelText: balanceQuantityText,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(19),
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              datepicker(context);
                            },
                            icon: const Icon(
                              Icons.date_range_outlined,
                              color: Colors.white,
                            ),
                            label: Text(
                              _formattedDate,
                              style: const TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.only(right: 20, left: 20),
                              backgroundColor: Colors.lightBlue,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: pendingItemTextEditor,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter the value';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(19),
                          ),
                          labelText: balanceItemText,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25, right: 25, top: 10, bottom: 5),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              if (pendingKey.currentState!.validate()) {
                                savePending();
                              }
                            });
                          },
                          icon: const Icon(
                            Icons.save_alt_sharp,
                            color: Colors.white,
                          ),
                          label: const Text(
                            'Submit',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlueAccent,
                            fixedSize: const Size(500, 50),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> datepicker(BuildContext context) async {
    //---------------------------------------------------------------date picking----------------------------------------
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _currentDate,
      firstDate: DateTime(2015),
      lastDate: DateTime(2050),
    );
    if (pickedDate != null && _currentDate != pickedDate) {
      setState(() {
        _formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
        // List datesplit = formattedDate.split('-');
        // int day = int.parse(datesplit[0]);
        // int month = int.parse(datesplit[1]);
        // int yeat = int.parse(datesplit[2]);
        // print(month.toString());
      });
    }
  }

  Future savePending() async {
    bool stateval1 = false;
    CollectionReference pendingCollref =
        FirebaseFirestore.instance.collection('PendingList');
    await pendingCollref.add({
      'Type of pending': pendingSelection,
      'Name': pendingNameTextEditor.text,
      'Date': _formattedDate,
      'Quantity or': pendingQuantityTextEditor.text,
      'Item Place': pendingItemTextEditor.text,
      'Delivered': '1',
    }).whenComplete(() {
      pendingNameTextEditor.clear();
      pendingQuantityTextEditor.clear();
      pendingItemTextEditor.clear();
      pendingSelection = '';
      bottomcontrolval = 0;
      stateval1 = true;
    });
    if (await pendingListget() && stateval1) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return const Homepagescreen();
      }));
    }
  }
}
