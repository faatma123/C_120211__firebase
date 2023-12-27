import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/pages/login.dart';
import 'package:flutter_application_5/pages/schooldashboard.dart';

class AuthState extends StatelessWidget {
  const AuthState({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), 
      builder: (context,user){
        if(user.hasData){
          return MyHomePage();
        }else{
          return Login();
        }
      }),
    );
  }
}
