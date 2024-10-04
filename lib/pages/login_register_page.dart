import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:internal_data_transfer/auth.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  String? errormessage='';
  bool isLogin=true;
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  Future<void> signInWithEmailAndPassword() async{
    try{
      await Auth().signInWithEmailAndPassword(email: email.text,password: password.text);
    }on FirebaseAuthException catch (e){
      setState(() {
        errormessage=e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async{
    try{
      await Auth().createUserWithEmailAndPassword(email: email.text, password: password.text);
    }on FirebaseAuthException catch (e){
      setState(() {
        errormessage=e.message;
      });
    }
  }

  Widget title(){
    return const Text('Firebase Auth');
  }

  // Widget entryField(String title, TextEditingController controller){
  //   return TextField(
  //     controller: controller,
  //     decoration: const InputDecoration(hintText: 'title'),
  //   );
  // }

  // Widget errorMessage(){
  //   return Text('$errormessage');
  // }

  Widget submitButton(){
    return ElevatedButton(
      onPressed: isLogin ? signInWithEmailAndPassword: createUserWithEmailAndPassword, 
      child: Text(isLogin?'Sign in': 'Sign Up'));
  }

  Widget loginorRegisterbutton(){
    return TextButton(
      onPressed: (){
        setState(() {
          isLogin=!isLogin;
        });
      }, 
      child:Text(isLogin?'Register Instead':'Login Instead')
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Firebase Auth'),
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        child: Column(
          children:<Widget> [
            // entryField('email', email),
            // entryField('password', password),
            TextField(
              controller: email,
              decoration: InputDecoration(hintText: 'email'),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: password,
              decoration: InputDecoration(hintText: 'password'),
            ),
            // errorMessage(),
            submitButton(),
            loginorRegisterbutton()
          ],
        ),
      ),
    );
  }
}