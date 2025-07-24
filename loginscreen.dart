// ignore_for_file: file_names
import 'package:conut_fin/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usertextController = TextEditingController();
  final passtextController = TextEditingController();
  final textfieldkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/rm222-mind-14.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: textfieldkey,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 130,
                  ),
                  const Center(
                    child: Text(
                      'Login In',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black),
                      controller: usertextController,
                      decoration: const InputDecoration(
                        errorStyle: TextStyle(color: Colors.red),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(19)),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(19))),
                        label: Text('Username'),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field cannot be empty';
                        } else if (value != 'conutfin') {
                          return 'username or password incorrect';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black),
                      controller: passtextController,
                      decoration: const InputDecoration(
                        errorStyle: TextStyle(color: Colors.red),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(19)),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(19),
                          ),
                        ),
                        label: Text('Password'),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field cannot be empty';
                        } else if (value != '2820') {
                          return 'username or password incorrect';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (textfieldkey.currentState!.validate()) {
                          getStored(context);
                        }
                      },
                      child: const Text('Login'),
                    ),
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                  const Center(
                    child: Text(
                      'This app is only for authorized clients',
                      style: TextStyle(fontSize: 11,color: Colors.blueGrey),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'For any enquiry contact at',
                      style: TextStyle(fontSize: 11,color: Colors.blueGrey),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'conutmkba313@gmail.com',
                      style: TextStyle(
                        fontSize: 11,
                        color: Color.fromARGB(255, 20, 130, 220),
                        height: -2.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> getStored(BuildContext context) async {
  final sharedPref = await SharedPreferences.getInstance();
  sharedPref.setBool('LoginVal', true);
  // ignore: use_build_context_synchronously
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) {
        return const Homepagescreen();
      },
    ),
  );
}
