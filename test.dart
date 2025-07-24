// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';

class Studentclass{     //student object class
  final String name;
  final String age;

  Studentclass({required this.name, required this.age});
}

ValueNotifier<List<Studentclass>> studentobjectList = ValueNotifier([]);

void addtolist(Studentclass value){
  studentobjectList.value.add(value);
  studentobjectList.notifyListeners();
}


//////This code is from the home page


// class homescreen extends StatefulWidget {
//   // ignore: prefer_const_constructors_in_immutables
//   homescreen({super.key});

//   @override
//   State<homescreen> createState() => _homescreenState();
// }

// class _homescreenState extends State<homescreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         bottomNavigationBar: BottomNavigationBar(items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.menu),
//             label: 'home',
//             activeIcon: Icon(Icons.abc)
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.menu),
//             label: 'menu',
//           ),
//         ]),
//         body: const SafeArea(
//           child: Center(
//             child: Column(
//               children: [
//                 textboxclass(),
//                 Expanded(child: listclass()),
//               ],
//             ),
//           ),
//         ));
//   }
// }

class textboxclass extends StatefulWidget {
  const textboxclass({super.key});

  @override
  State<textboxclass> createState() => _textboxclassState();
}

class _textboxclassState extends State<textboxclass> {
  final namecontroller = TextEditingController();

  final agecontroller = TextEditingController();
  final textkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: textkey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Error';
              } else {
                return null;
              }
            },
            controller: namecontroller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Name'),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Error';
              } else {
                return null;
              }
            },
            controller: agecontroller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Age'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (textkey.currentState!.validate()) {
                var name = namecontroller.text;
                var age = agecontroller.text;
                var data = Studentclass(name: name, age: age);
                addtolist(data);
                namecontroller.clear();
                agecontroller.clear();
              }
            },
            child: const Text('Click to add'),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class listclass extends StatelessWidget {
  const listclass({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentobjectList,
      builder: (context, value, child) {
        return ListView.separated(
          itemBuilder: (context, index) {
            var val = value[index];
            return ListTile(
              title: Text(val.name),
              subtitle: Text(val.age),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: value.length,
        );
      },
    );
  }
}
