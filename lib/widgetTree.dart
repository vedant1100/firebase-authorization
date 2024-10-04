import 'package:flutter/material.dart';
import 'package:internal_data_transfer/auth.dart';
import 'package:internal_data_transfer/pages/login_register_page.dart';
import 'package:internal_data_transfer/pages/splashScreen.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
       builder: (builder,snapshot){
        if(snapshot.hasData){
          return splashScreen();
        }
        return const loginPage();
       }
      );
  }
}