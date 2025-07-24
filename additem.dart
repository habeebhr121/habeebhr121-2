import 'package:conut_fin/pages/subtransaction/incomingfundstab.dart';
import 'package:conut_fin/screens/transactions.dart';
import 'package:conut_fin/widgets/itempick.dart';
import 'package:flutter/material.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => AddItemScreenState();
}

class AddItemScreenState extends State<AddItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(221, 0, 9, 39),
      body: SafeArea(
          child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      
                    },
                    icon: const Icon(Icons.arrow_back)),
                const Text(
                  'Add Item',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        editval = false;
                      });
                      
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                        return const TransactionPage();
                      }));
                    },
                    child: const Text('Done')),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const ItemWidgetclassState(),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 125),
            child: ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  setState(
                    () {
                      if (itemsKey.currentState!.validate() &&
                          item1dropselection != '') {
                        ItemsData itemclassData = ItemsData(
                          itemName: item1dropselection,
                          itemQty: itemQtytexteditor.text,
                          itemPrice: itemPricetexteditor.text,
                          itemAmount: itemAmounttexteditor.text,
                        );
                        objectItemData.add(itemclassData);
                        itemnum = objectItemData.length;
                        netTotal = 0;
                        for (int i = 0; i < objectItemData.length; i++) {
                          netTotal = netTotal +
                              int.parse(objectItemData[i].itemAmount);
                        }
                        editval = false;
                        itemQtytexteditor.clear();
                        itemAmounttexteditor.clear();
                        itemPricetexteditor.clear();
                        //item1dropselection = '';
                        
                      }
                    },
                  );
                });
              },
              icon: const Icon(
                Icons.post_add_outlined,
                color: Colors.white,
              ),
              label: const Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                fixedSize: const Size(500, 50),
              ),
            ),
          ),
          Itemtotal(numclick: itemnum),
        ],
      )),
    );
  }
}
