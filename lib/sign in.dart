import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'dashpage.dart';
class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> signup() async
  {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text);

      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>dash()));


    }

    catch(e)
    {
      print(e);

    }
  }
  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }


  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Account"),
      ),
      body: Form(
        key: _key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  label: Text("Email"),
                  border: OutlineInputBorder(),
                ),
                validator: (input)
                {
                  if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(input!))
                  {
                    return"enter valid email";
                  }
                  return null;
                },
                controller: email,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  label: Text("password"),
                  border: OutlineInputBorder(),
                ),
                controller: password,
                validator: (input)
                {
                  if(input == null || input.isEmpty)
                  {
                    return"enter valid password";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: ()
              {
                if(_key.currentState!.validate())
                {
                  signup();
                }
              }, child: Text("Signup")),
            ),

          ],
        ),
      ),
    );
  }
}

class _googleSignIn {
  static signIn() {}
}
