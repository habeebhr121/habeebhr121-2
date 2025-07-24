import 'package:conut_fin/pages/subtransaction/incomingfundstab.dart';
import 'package:flutter/material.dart';

List itemslist = [
  'Conut Oil ',
  'Hair Oil',
  'Body wash',
  'Coconut shampoo',
  'Heath Mix',
  'Cow dung powder',
  'Vermi wash',
  'Punnak',
  'Vermi Powder'
];
//String item1dropselection = '';
bool receiptvisibility = true;
final itemQtytexteditor = TextEditingController();
final itemPricetexteditor = TextEditingController();
final itemAmounttexteditor = TextEditingController();

class ItemsData {
  String itemName;
  String itemQty;
  String itemPrice;
  String itemAmount;
  ItemsData({
    required this.itemName,
    required this.itemQty,
    required this.itemPrice,
    required this.itemAmount,
  });
}

List<ItemsData> objectItemData = [];

class Itemtotal extends StatefulWidget {
  final int numclick;
  const Itemtotal({super.key, required this.numclick});

  @override
  State<Itemtotal> createState() => _ItemtotalState();
}

bool editval = false;
String edittextbutton = 'edit';
int lenItemList = objectItemData.length;
final itemsKey = GlobalKey<FormState>();

class _ItemtotalState extends State<Itemtotal> {
  @override
  Widget build(BuildContext context) {
    lenItemList = objectItemData.length;
    netTotal = 0;
    for (int i = 0; i < objectItemData.length; i++) {
      netTotal = netTotal + int.parse(objectItemData[i].itemAmount);
    }

    return lenItemList != 0
        ? Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            TextButton.icon(
              style: const ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(Size(2, 3))),
              onPressed: () {
                setState(
                  () {
                    editval = !editval;
                    if (editval) {
                      edittextbutton = 'done';
                    } else {
                      edittextbutton = 'edit';
                    }
                  },
                );
              },
              icon: Visibility(
                visible: !editval,
                child: const Icon(
                  Icons.mode_edit_outline_outlined,
                  size: 15,
                ),
              ),
              label: Text(
                edittextbutton,
              ),
            ),
            Card(
              color: Colors.blueGrey,
              //---------------------------------starting of items selected -------------------
              margin: const EdgeInsets.only(bottom: 15),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Items',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Text(
                          "Quantity",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Text(
                          "Price",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline,
                          ),
                        )
                      ],
                    ),
                    Builder(
                      builder: (context) {
                        int itemval = 0;
                        return lenItemList >= itemval + 1
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                    Row(
                                      children: [
                                        Visibility(
                                          visible: editval,
                                          child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  objectItemData
                                                      .removeAt(itemval);
                                                  lenItemList =
                                                      objectItemData.length;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.delete_outline_outlined,
                                                color: Colors.red,
                                              )),
                                        ),
                                        Text(objectItemData[itemval].itemName),
                                      ],
                                    ),
                                    Text(
                                        "x   ${objectItemData[itemval].itemQty}"),
                                    Text(objectItemData[itemval].itemAmount)
                                  ])
                            : Container();
                      },
                    ),
                    Builder(
                      builder: (context) {
                        int itemval = 1;
                        return lenItemList >= itemval + 1
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                    Row(
                                      children: [
                                        Visibility(
                                          visible: editval,
                                          child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  objectItemData
                                                      .removeAt(itemval);
                                                  lenItemList =
                                                      objectItemData.length;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.delete_outline_outlined,
                                                color: Colors.red,
                                              )),
                                        ),
                                        Text(objectItemData[itemval].itemName),
                                      ],
                                    ),
                                    Text(
                                        "x   ${objectItemData[itemval].itemQty}"),
                                    Text(objectItemData[itemval].itemAmount)
                                  ])
                            : Container();
                      },
                    ),
                    Builder(
                      builder: (context) {
                        int itemval = 2;
                        return lenItemList >= itemval + 1
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                    Row(
                                      children: [
                                        Visibility(
                                          visible: editval,
                                          child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  objectItemData
                                                      .removeAt(itemval);
                                                  lenItemList =
                                                      objectItemData.length;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.delete_outline_outlined,
                                                color: Colors.red,
                                              )),
                                        ),
                                        Text(objectItemData[itemval].itemName),
                                      ],
                                    ),
                                    Text(
                                        "x   ${objectItemData[itemval].itemQty}"),
                                    Text(objectItemData[itemval].itemAmount)
                                  ])
                            : Container();
                      },
                    ),
                    Builder(
                      builder: (context) {
                        int itemval = 3;
                        return lenItemList >= itemval + 1
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                    Row(
                                      children: [
                                        Visibility(
                                          visible: editval,
                                          child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  objectItemData
                                                      .removeAt(itemval);
                                                  lenItemList =
                                                      objectItemData.length;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.delete_outline_outlined,
                                                color: Colors.red,
                                              )),
                                        ),
                                        Text(objectItemData[itemval].itemName),
                                      ],
                                    ),
                                    Text(
                                        "x   ${objectItemData[itemval].itemQty}"),
                                    Text(objectItemData[itemval].itemAmount)
                                  ])
                            : Container();
                      },
                    ),
                    Builder(
                      builder: (context) {
                        int itemval = 4;
                        return lenItemList >= itemval + 1
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                    Row(
                                      children: [
                                        Visibility(
                                          visible: editval,
                                          child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  objectItemData
                                                      .removeAt(itemval);
                                                  lenItemList =
                                                      objectItemData.length;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.delete_outline_outlined,
                                                color: Colors.red,
                                              )),
                                        ),
                                        Text(objectItemData[itemval].itemName),
                                      ],
                                    ),
                                    Text(
                                        "x   ${objectItemData[itemval].itemQty}"),
                                    Text(objectItemData[itemval].itemAmount)
                                  ])
                            : Container();
                      },
                    ),
                    Builder(
                      builder: (context) {
                        int itemval = 5;
                        return lenItemList >= itemval + 1
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                    Row(
                                      children: [
                                        Visibility(
                                          visible: editval,
                                          child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  objectItemData
                                                      .removeAt(itemval);
                                                  lenItemList =
                                                      objectItemData.length;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.delete_outline_outlined,
                                                color: Colors.red,
                                              )),
                                        ),
                                        Text(objectItemData[itemval].itemName),
                                      ],
                                    ),
                                    Text(
                                        "x   ${objectItemData[itemval].itemQty}"),
                                    Text(objectItemData[itemval].itemAmount)
                                  ])
                            : Container();
                      },
                    ),
                    Builder(
                      builder: (context) {
                        int itemval = 6;
                        return lenItemList >= itemval + 1
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                    Row(
                                      children: [
                                        Visibility(
                                          visible: editval,
                                          child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  objectItemData
                                                      .removeAt(itemval);
                                                  lenItemList =
                                                      objectItemData.length;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.delete_outline_outlined,
                                                color: Colors.red,
                                              )),
                                        ),
                                        Text(objectItemData[itemval].itemName),
                                      ],
                                    ),
                                    Text(
                                        "x   ${objectItemData[itemval].itemQty}"),
                                    Text(objectItemData[itemval].itemAmount)
                                  ])
                            : Container();
                      },
                    ),
                    Builder(
                      builder: (context) {
                        int itemval = 7;
                        return lenItemList >= itemval + 1
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                    Row(
                                      children: [
                                        Visibility(
                                          visible: editval,
                                          child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  objectItemData
                                                      .removeAt(itemval);
                                                  lenItemList =
                                                      objectItemData.length;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.delete_outline_outlined,
                                                color: Colors.red,
                                              )),
                                        ),
                                        Text(objectItemData[itemval].itemName),
                                      ],
                                    ),
                                    Text(
                                        "x   ${objectItemData[itemval].itemQty}"),
                                    Text(objectItemData[itemval].itemAmount)
                                  ])
                            : Container();
                      },
                    ),
                    Builder(
                      builder: (context) {
                        int itemval = 8;
                        return lenItemList >= itemval + 1
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                    Row(
                                      children: [
                                        Visibility(
                                          visible: editval,
                                          child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  objectItemData
                                                      .removeAt(itemval);
                                                  lenItemList =
                                                      objectItemData.length;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.delete_outline_outlined,
                                                color: Colors.red,
                                              )),
                                        ),
                                        Text(objectItemData[itemval].itemName),
                                      ],
                                    ),
                                    Text(
                                        "x   ${objectItemData[itemval].itemQty}"),
                                    Text(objectItemData[itemval].itemAmount)
                                  ])
                            : Container();
                      },
                    ),
                    Builder(
                      builder: (context) {
                        int itemval = 9;
                        return lenItemList >= itemval + 1
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                    Row(
                                      children: [
                                        Visibility(
                                          visible: editval,
                                          child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  objectItemData
                                                      .removeAt(itemval);
                                                  lenItemList =
                                                      objectItemData.length;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.delete_outline_outlined,
                                                color: Colors.red,
                                              )),
                                        ),
                                        Text(objectItemData[itemval].itemName),
                                      ],
                                    ),
                                    Text(
                                        "x   ${objectItemData[itemval].itemQty}"),
                                    Text(objectItemData[itemval].itemAmount)
                                  ])
                            : Container();
                      },
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            'Net total',
                            style: TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(width: 90),
                          Text(
                            netTotal.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ])
        : Container();
  }
}

//------------------------------------------------------------item selection box-----------------------------------

class ItemWidgetclassState extends StatefulWidget {
  const ItemWidgetclassState({super.key});

  @override
  State<ItemWidgetclassState> createState() => __ItemWidgetclassStateState();
}

class __ItemWidgetclassStateState extends State<ItemWidgetclassState> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                style: BorderStyle.solid,
                color: const Color.fromARGB(255, 104, 197, 243),
                width: 0.5),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Form(
            key: itemsKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Item',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 5,
                ),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(11))),
                  ),
                  //value: 'Conut Oil',
                  onChanged: ((newvalue) {
                    item1dropselection = newvalue.toString();
                  }),
                  hint: const Text('Item'),
                  items: itemslist.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    );
                  }).toList(),
                  
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Quantity'),
                    Text('        Price per quantity'),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 140,
                      child: TextFormField(
                        controller: itemQtytexteditor,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if(value == null || value.isEmpty || value == '0')
                          {
                            return 'Fill the quantity';
                          }else{
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: '/-',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 140,
                      child: TextFormField(
                        controller: itemPricetexteditor,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if(value == null || value.isEmpty|| value == '0')
                          {
                            return 'Fill the price';
                          }else{
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: '/-',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text('Amount'),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  onTap: () {
                    try{
                     itemAmounttexteditor.text = (int.parse(itemPricetexteditor.text) * int.parse(itemQtytexteditor.text)).toString();
                    }
                    catch(e)
                    {
                      print(e);
                    }
                  },
                  controller: itemAmounttexteditor,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                          if(value == null || value.isEmpty)
                          {
                            return 'Fill the amount';
                          }else{
                            return null;
                          }
                        },
                  decoration:  const InputDecoration(
                    hintText: '/-',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(11))),
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
