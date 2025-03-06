import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:toddo/sign%20in.dart';


import 'dashpage.dart';


class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

/// google sign in
  final GoogleSignIn  googleSignIn = GoogleSignIn(
    clientId:
    "987101233049-mmn52h8ckg287ol1k59msp6al8a032or.apps.googleusercontent.com",
  );

  Future<User?> signInWithGoogle(BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential;
      if (kIsWeb) {
        var googleProvider = GoogleAuthProvider();
        userCredential = await _auth.signInWithPopup(googleProvider);
      } else {
        GoogleSignInAccount googleUser = (await GoogleSignIn().signIn())!;
        final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
        final googleAuthCredential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        userCredential = await _auth.signInWithCredential(googleAuthCredential);
      }
      final user = userCredential.user;
      if (user != null) {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>dash()));
      }
    } catch (e) {
      print(e);
    }
  }
///
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> loginaccunt() async
  {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text,
          password: password.text);

      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>dash()));

      setState(() {

      });

    }

    catch(e)
    {
      print(e);

  }
}


final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
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
                        loginaccunt();
                      }


                  }, child: Text("Login")),
            ),
            OutlinedButton(onPressed: (){
             setState(() {

               signInWithGoogle(context);
             });
            }, child: Text('Google sign in')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Do have account'),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: 8.0),
                  child: TextButton(onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>signin()));
                  }, child: Text("Sign up?",style: TextStyle(color: Colors.blue),),)
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
