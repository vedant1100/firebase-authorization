import 'package:flutter/material.dart';

class welcomeScreen extends StatelessWidget {
  String name,email,phone;
  welcomeScreen({required this.name,required this.email,required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Welcome Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: $name'),
            Text('Email: $email'),
            Text('Phone No: $phone'),
          ],
        ),
      ),
    );
  }
}
