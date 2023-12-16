import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pencarian_kos/login.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth _auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Community",
          style: TextStyle(color: Colors.white),
        ), // Text
        backgroundColor: Colors.deepPurple,
        actions: [
          InkWell(
              onTap: () {
                _auth.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              )),
        ],
      ),
    );
  }
}