import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:internal_data_transfer/auth.dart';
import 'package:internal_data_transfer/main.dart';
import 'package:internal_data_transfer/pages/welcomeScreen.dart';

class splashScreen extends StatefulWidget {
  splashScreen( {super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController phone=TextEditingController();
  final User? user= Auth().currentUser;

  Future<void> signOut() async{
    await Auth().signOut();
  }

  Widget userId(){
    return Text(user?.email??'user email');
  }

  Widget signOutButton(){
    return ElevatedButton(
      onPressed: signOut, 
      child: const Text('Sign Out'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Dashboard'),

        actions: [
          userId(),
          signOutButton()
        ],
      ),

      body: Column(
        children: [
          Center(child: Text('Enter data to send it to Welcome Screen')),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: name,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter name',
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: email,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter email',
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter phone number',
              ),
            ),
          ),
          const SizedBox(height: 20,),

          ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>welcomeScreen(name: name.text, email: email.text, phone: phone.text)));
              },
              child: const Text('Submit')
          ),
          const SizedBox(height: 20),

          Center(
            child: ElevatedButton(
                onPressed: (){
                  final snackBar=SnackBar(
                      content: const Text('Return?'),
                    action: SnackBarAction(
                        label: 'Undo',
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
                        }
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              child: const Text('Click to enable Snackbar'),
            ),
          )
        ],
      ),
    );
  }
}
