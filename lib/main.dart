
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:toddo/sign%20in.dart';


import 'firebase_options.dart';
import 'homepage.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:FirebaseOptions(
        apiKey: "AIzaSyDcfxQgHKsaJvTjIC3WiboPfRZXAFrGNys",
        authDomain: "sign-36f54.firebaseapp.com",
        projectId: "sign-36f54",
        storageBucket: "sign-36f54.firebasestorage.app",
        messagingSenderId: "987101233049",
        appId: "1:987101233049:web:f9f465fa47bcaa8e749d08",
        measurementId: "G-5MW7ZPWPSB"
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
      home:Splashscreen(),
      //Splashscreen(),
    );
  }
}

