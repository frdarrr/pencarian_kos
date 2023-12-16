import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pencarian_kos/homepage.dart';
import 'package:pencarian_kos/login.dart';
import 'package:pencarian_kos/profile.dart';


FirebaseApp? app;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAqT1m2QlFkE6AkvC8NOiVeN--7fL13aIo",
      appId: "1:346271534311:android:5a47eb1c3485d820662642",
      messagingSenderId: "Messaging sender id here",
      projectId: "restapikost",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: homepage(),
      // home: LoginView(),
     
    );
  }
}
