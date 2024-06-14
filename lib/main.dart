import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wallify/Admin/admin_login.dart';
import 'package:wallify/pages/bottomNav.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid ? await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyDS_28X6GEwW52aHKIn2jL-Ic79R4gFRPU',
        appId: '1:931777036353:android:d016441d3b35fd975f86c0',
        messagingSenderId: '931777036353',
        projectId: 'wallify-dbb60',
      storageBucket: 'gs://wallify-dbb60.appspot.com'
    )
  ) : await Firebase.initializeApp();
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
      home: BottomNav(),
    );
  }
}
