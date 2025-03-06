import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'dashpage.dart';
import 'login.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  var User = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2),(){
      if (User == null)
      {
        openlogin();
      }
      else
        {
          opendash();
        }
    });

    super.initState();
  }
  void openlogin(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>login()));

  }
  void opendash(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>dash()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height:200,
              width:150,
              decoration: BoxDecoration(
                color: Colors.cyan,
                shape: BoxShape.circle,
                border: Border.all()
                // image: DecorationImage(
                //   fit: BoxFit.fill,
                //     image: NetworkImage("https://freepngimg.com/static/img/nature.png"),
                // ),
              ),
              child: Center(child: Text("GoAuth ")),
            ),
          ),
        ],
      ),
    );
  }


}
