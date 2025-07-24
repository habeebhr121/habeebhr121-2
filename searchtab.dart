import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Searchtab extends StatelessWidget {
  const Searchtab({super.key});

  @override
  Widget build(BuildContext context) {
    String name = "habeeb";
    String email = "Habeeb@gmail.com";
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('hello'),
          ElevatedButton(
            onPressed: () {
              CollectionReference collref = FirebaseFirestore.instance.collection("user1");
              collref.add({
                "name": name,
                "email": email,
                "list":["hello","my world"],
              }).whenComplete(() {
                print('Saved successfully');
              });
            },
            child: const Text('Save data'),
          ),
          ElevatedButton(
              onPressed: () {
                getdata();
              },
              child: const Text('get data'))
        ],
      ),
    );
  }
}

void getdata() async {
  CollectionReference collref = FirebaseFirestore.instance.collection("user1");
  try{
  QuerySnapshot querySnapshot = await collref.get();
  for (var element in querySnapshot.docs) {
    print("Id:${element.id}");
    print("name:${element['name']}");
    print("Email:${element['email']}");
    print("object ${element['list']}");
    print(element['list'].length);
  }
  }
  catch(e){
    print(e);
  }
}
