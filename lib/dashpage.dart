import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';


class dash extends StatefulWidget {
  const dash({super.key});

  @override
  State<dash> createState() => _dashState();
}

class _dashState extends State<dash> {

  var user = FirebaseAuth.instance.currentUser;

  List lis = [];

  TextEditingController ctrl = TextEditingController();
  TextEditingController ctrl1 = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text("Dash board"),
        actions: [
          ElevatedButton(
              onPressed: () async{

                await FirebaseAuth.instance.signOut();

                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Splashscreen()));

              }, child: Text("LogOut")),
        ],
      ),
      body: Column(

        children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: ctrl,
              decoration: InputDecoration(
                label: Text("Enter data"),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          OutlinedButton(
              onPressed: (){
           setState(() {
             lis.add(ctrl.text);
           });
          }, child: Text('Add')),


          Expanded(
            child: ListView.builder(
              itemCount: lis.length,
                itemBuilder: (BuildContext,index)
                    {
                      return Card(
                        child: ListTile(
                          onTap: (){},
                          title: Text(lis[index]),
                          trailing: Container(
                            width: 80,
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      lis.removeAt(index);
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.delete),
                                  ),
                                ),
                                InkWell(
                                  onTap: ()
                                  {
                                    showDialog(context: (context), builder: (BuildContext)
                                    {
                                      return AlertDialog(
                                        title:  Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            controller: ctrl1,
                                            decoration: InputDecoration(
                                              label: Text("Update data"),
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                        actions: [
                                          OutlinedButton(onPressed: (){

                                            setState(() {

                                              lis[index] = ctrl1.text;

                                              Navigator.pop(context);
                                            });
                                          },
                                              child: Text("Update"))
                                        ],
                                        
                                      );
                                    }
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.edit),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }
            ),
          ),



        ],
      ),
    );
  }
}
